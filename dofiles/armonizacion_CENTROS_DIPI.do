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
use $dta/CentroInfantil_vf3.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\CentroInfantil_vf3.dta, clear

***********
*Seccion 0*
***********
rename s0_1 muni
label var muni "Municipio"

rename s0_2 distredu
label var distredu "Distrito Educatvio"

rename s0_3 folio
label var folio "Folio"

rename s0_5 type_dipi
label var type_dipi "Tipo de establecimiento"

rename s0_6 nombre_UE
label var nombre_UE "Unidad Educativa"

rename s0_7 nombre
label var nombre "Nombre del encuestado"

rename s0_8 cargo
label var cargo "cargo"

rename s0_9 coden
label var coden "Codigo encuestador"

rename s0_10 observaciones
label var observaciones ""

global $s0 folio muni distredu nombre_UE nombre cargo coden

***********
*Seccion 1*
***********
forv i=1/9{
rename s1_1_0`i' s1_1_`i' 
}

forv i=1/23{
cap drop n1_`i'
gen n1_`i'=(s1_1_`i'==1) if s1_1_`i'!=.
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

global $s1 n* normas_*

***********
*Seccion 2*
***********
*Verificar estacion de lavado de manos
forv j=1/11{
cap drop s2_4_`j'
gen s2_4_`j'=(strpos(s2_4,"`j'")>0)	
}
 
*Fuentes mejoradas de agua
note: tubería o pileta pública, pozo entubado/de perforación, /*
*/    pozo excavado protegido, vertiente protegida, y agua de lluvia

cap drop magua
gen magua=(s2_1<=7)
replace magua=0 if s2_1==5
replace magua=. if s2_1==.
label var magua "Fuente mejorada de agua"

*Instalaciones mejoradas de saneamiento
note: alcantarillado, tanque séptico, descarga hidráulica con cisterna /*
*/    o manual a un pozo, baño seco ecológico, la letrina de pozo 

cap drop instal
gen instal=(s2_3<=6) if s2_3!=.
replace instal=0 if s2_2==2
label var instal "Fuente mejoradas de saneamiento"

*Estaciones de lavado de manos
note: Lavamanos, lavanderías, grifo, o cualquier alternativa que cuenten /*
*/    con agua corriente y jabón para el lavado de manos

cap drop lvmanos_1
gen lvmanos_1=0
replace lvmanos_1=1 if s2_4_1==1
replace lvmanos_1=1 if s2_4_3==1
replace lvmanos_1=1 if s2_4_5==1
replace lvmanos_1=1 if s2_4_7==1
replace lvmanos_1=1 if s2_4_8==1
replace lvmanos_1=1 if s2_4_9==1
replace lvmanos_1=1 if s2_4_10==1
label var lvmanos_1 "Estacion limpia"

cap drop lvmanos_2
gen lvmanos_2=0
replace lvmanos_2=1 if s2_4_2==1
replace lvmanos_2=1 if s2_4_4==1
replace lvmanos_2=1 if s2_4_6==1
replace lvmanos_2=1 if s2_4_11==1
label var lvmanos_2 "Estacion no limpia"

cap drop _lvmanos
gen _lvmanos=(s2_4!="")
label var _lvmanos "Cuenta con estacion de lava manos"
 
global $s0 folio muni distredu nombre_UE nombre cargo coden
global $s1 n* normas_*
global $s2 magua instal lvmanos*

order folio muni distredu nombre_UE nombre type* cargo n* /*
*/    normas_* magua instal lvmanos* observaciones coden
keep folio muni distredu nombre_UE nombre type* cargo n* /*
*/   normas_* magua instal _lvmanos* observaciones coden

saveold $dta/DIPI_armon.dta, replace


























