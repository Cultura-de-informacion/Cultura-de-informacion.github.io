*******************************************************************************
********************************************************************************
***               This code is property of FUNDACION ARU                     ***
********************************************************************************
********************************************************************************
***      Author1 : Laura Uzquiano MonzÛn
***      Author2 : ...
***      Comments: luzquiano@aru.org.bo
********************************************************************************
***      Program : UNICEF linea base
***      Version : 01              
***      Objetive: Armonizacion
********************************************************************************
*MAC
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dtafiles"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/CentroEducativo_vf10.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\CentroEducativo_vf10.dta, clear

***********
*Seccion 0*
***********
rename s0_1 muni
label var muni "Municipio"

rename s0_2 distredu
label var distredu "Distrito Educatvio"

rename s0_3 folio
label var folio "Folio"

rename s0_5 nombre_UE
label var nombre_UE "Unidad Educativa"

rename s0_6 nombre
label var nombre "Nombre del encuestado"

rename s0_7 cargo
label var cargo "cargo"

drop s0_4
global s0 "folio muni distredu nombre_UE nombre cargo"

***********
*Seccion 1*
***********
*Existe CESC en primaria
rename s1_1_1 s1_1prim
cap drop cesc_prim
gen cesc_prim=(s1_1prim<=2)  
label var cesc_prim "CESC primaria"

*Existe CESC en secundaria
rename s1_1_2 s1_1sec
cap drop cesc_sec
gen cesc_sec=(s1_1sec<=2)  
label var cesc_sec "CESC secundaria"
 
***
*Los estudiantes de primaria participan como miembros activos de las CESC
rename s1_2_1 s1_2prim
cap drop Pcesc_prim
gen Pcesc_prim=(s1_2prim<=2)  
replace Pcesc_prim=. if cesc_prim==0
label var Pcesc_prim "Participacion de estudiantes en CESC primaria"

*Los estudiantes de secundaria participan como miembros activos de las CESC
rename s1_2_2 s1_2sec
cap drop Pcesc_sec
gen Pcesc_sec=(s1_2sec<=2)  
replace Pcesc_sec=. if cesc_sec==0
label var Pcesc_sec "Participacion de estudiantes en CESC secundaria"

global s1 "cesc_prim cesc_sec Pcesc_prim Pcesc_sec"

***********
*Seccion 2*
***********
*Existe Gobierno Estudiantil en la UE
label var s2_1 "Gobierno Estudiantil 2018"

rename s2_2_1 qmen_ge
label var qmen_ge "Cantidad de hombres en GE"

rename s2_2_2 qwomen_ge
label var qwomen_ge "Cantidad de mujeres en GE"

cap drop qtot_ge /*total miembros*/
gen qtot_ge=(qmen_ge+qwomen_ge)
label var qtot_ge "Cantidad total miembros GE"

*Actividades de despatriarcalizacion
rename s2_4 act_ge
label var act_ge "Actividades de despatriarcalizacion"

global s2 "qmen_ge qwomen_ge qtot_ge act_ge"

***********
*Seccion 3*
***********
**Actividades de prevencion contra la violencia en escuelas
*Charlas informativas, seminarios, talleres dinamicos
forv i=1/3{
cap drop s3_talleres_`i'
gen s3_talleres_`i'=(strpos(s3_1_1,"`i'")>0)	
}

rename s3_talleres_1 talleres_doc 
rename s3_talleres_2 talleres_fam
rename s3_talleres_3 talleres_estud

*Capacitaciones en protocolos de asistencia
forv i=1/3{
cap drop s3_asistencia_`i'
gen s3_asistencia_`i'=(strpos(s3_1_2,"`i'")>0)	
}
rename s3_asistencia_1 asistencia_doc 
rename s3_asistencia_2 asistencia_fam
rename s3_asistencia_3 asistencia_estud

*Actividades de convivencia
forv i=1/3{
cap drop s3_convivencia_`i'
gen s3_convivencia_`i'=(strpos(s3_1_3,"`i'")>0)	
}
rename s3_convivencia_1 convivencia_doc 
rename s3_convivencia_2 convivencia_fam
rename s3_convivencia_3 convivencia_estud

*Otras actividades contra violencia
forv i=1/3{
cap drop s3_otro_`i'
gen s3_otro_`i'=(strpos(s3_1_3,"`i'")>0)	
}
rename s3_otro_1 otro_doc 
rename s3_otro_2 otro_fam
rename s3_otro_3 otro_estud

**Actividades contra violencia destinadas a docentes
cap drop vdoc
gen vdoc=0
replace vdoc=1 if talleres_doc==1
replace vdoc=1 if asistencia_doc==1
replace vdoc=1 if convivencia_doc==1
label var vdoc "Actividades contra violencia destinadas a docentes"

**Actividades contra violencia destinadas a padres/madres
cap drop vfam
gen vfam=0
replace vfam=1 if talleres_fam==1
replace vfam=1 if asistencia_fam==1
replace vfam=1 if convivencia_fam==1
label var vfam "Actividades contra violencia destinadas a padres/madres"

**Actividades contra violencia destinadas a estudiantes
cap drop vestud
gen vestud=0
replace vestud=1 if talleres_estud==1
replace vestud=1 if asistencia_estud==1
replace vestud=1 if convivencia_estud==1
label var vestud "Actividades contra violencia destinadas a estudiantes"

*Iniciativa
forv i=1/2{
cap drop s3_3_`i'
gen s3_3_`i'=(strpos(s3_3,"`i'")>0)	
}

rename s3_3_1 iniciativ_prop
rename s3_3_2 iniciativ_extern

global s3 "talleres_* asistencia_* convivencia_* vdoc vfam vestud iniciativ*"

***********
*Seccion 4*
***********
*Total docentes en la Unidad Educativa
cap drop qtot_doc
egen qtot_doc=rsum(p4_2_1 p4_2_2)
label var qtot_doc "Cantidad total de docentes en la UE"

*Total docentes de primaria PROFOCOM
cap drop qprim_doc
egen qprim_doc=rsum(p4_1_1_1)
label var qprim_doc "Cantidad total de docentes PROFOCOM primaria"

*Total docentes de secundaria PROFOCOM
cap drop qsec_doc
egen qsec_doc=rsum(p4_1_2_1)
label var qsec_doc "Cantidad total de docentes PROFOCOM secundaria"

*Total docentes PROFOCOM
cap drop docPROFOCOM
egen docPROFOCOM=rsum(qprim_doc qsec_doc)
label var docPROFOCOM "Cantidad total de docentes PROFOCOM"

*Total docentes de primaria OTRO-PROFOCOM
cap drop OTROPROFOCOM_prim
egen OTROPROFOCOM_prim=rsum(p4_1_1_3)
label var OTROPROFOCOM_prim "Cantidad total de docentes OTRO PROFOCOM primaria"

*Total docentes de secundaria OTRO-PROFOCOM
cap drop OTROPROFOCOM_sec
egen OTROPROFOCOM_sec=rsum(p4_1_2_3)
label var OTROPROFOCOM_sec "Cantidad total de docentes OTRO PROFOCOM secundaria"

global s4 "qtot_doc qprim_doc qsec_doc docPROFOCOM OTROPROFOCOM_prim OTROPROFOCOM_sec"

***********
*Seccion 5*
***********
*Tiene nivel inicial
cap drop _flagDIPI
gen _flagDIPI=(s5_1==1)

*Nivel inicial de la Unidad Educativa
forv i=1/9{
rename s5_3_0`i' s5_3_`i' 
}

forv i=1/23{
cap drop n1_`i'
gen n1_`i'=(s5_3_`i'==1) if s5_3_`i'!=.
}
 
cap drop normas_1
egen normas_1=rsum(n1_1 n1_2 n1_3 n1_4)
label var n1_1 "Normas 1: Ambiente adecuado"
label var n1_2 "Normas 2: Equipamiento"
label var n1_3 "Normas 3: Material didactivo"
label var n1_4 "Normas 4: Saneamiento"

cap drop normas_2
egen normas_2=rsum(n1_5 n1_6 n1_7 n1_8 n1_9 n1_10)
label var n1_5 "Normas 5: Recursos humanos"
label var n1_6 "Normas 6: Cuidadores"
label var n1_7 "Normas 7: Supervision y administracion"
label var n1_8 "Normas 8: Otro personal"
label var n1_9 "Normas 9: Coordinación central"
label var n1_10 "Normas 10: Practicas disciplinarias"

cap drop normas_3
egen normas_3=rsum(n1_11 n1_12 n1_13 n1_14 n1_15)
label var n1_11 "Normas 11: Salud"
label var n1_12 "Normas 12: Alimentacion"
label var n1_13 "Normas 13: Atencion medica"
label var n1_14 "Normas 14: Vacunacion"
label var n1_15 "Normas 15: Nutricion"

cap drop normas_4
egen normas_4=rsum(n1_16 n1_17 n1_18)
label var n1_16 "Normas 16: Educacion"
label var n1_17 "Normas 17: Aprendizaje temprano"
label var n1_18 "Normas 18: Accesibilidad"

cap drop normas_5
egen normas_5=rsum(n1_19 n1_20 n1_21 n1_22 n1_23)
label var n1_19 "Normas 19: Proteccion"
label var n1_20 "Normas 20: Vulnerabilidad"
label var n1_21 "Normas 21: Horfandad"
label var n1_22 "Normas 22: Involucramiento en act. laboral"
label var n1_23 "Normas 23: Caracteristicas del hogar"

label var normas_1 "Normas de ambiente"
label var normas_2 "Normas de recursos humanos"
label var normas_3 "Normas de salud"
label var normas_4 "Normas de educacion"
label var normas_5 "Normas de proteccion"

global s5 "n1_* normas_*"

***********
*SECCION 6*
***********
rename s6_1 coden
label var coden "Codigo del encuestador"

rename s6_2 observaciones
label var observaciones "Observaciones"

order folio muni distredu nombre_UE nombre cargo /*
*/    cesc_prim cesc_sec Pcesc_prim Pcesc_sec    /*
*/    qmen_ge qwomen_ge qtot_ge act_ge           /*
*/    talleres_* asistencia_* convivencia_* vdoc vfam vestud /*
*/    qtot_doc qprim_doc qsec_doc docPROFOCOM _flagDIPI n1_* normas_* /*
*/    observaciones coden

keep folio muni distredu nombre_UE nombre cargo /*
*/    cesc_prim cesc_sec Pcesc_prim Pcesc_sec    /*
*/    qmen_ge qwomen_ge qtot_ge act_ge           /*
*/    talleres_* asistencia_* convivencia_* vdoc vfam vestud /*
*/    qtot_doc qprim_doc qsec_doc docPROFOCOM n1_* normas_* /*
*/    observaciones coden _flagDIPI OTROPROFOCOM_* iniciativ*

saveold $dta/UnidadesEducativas_armon.dta, replace









