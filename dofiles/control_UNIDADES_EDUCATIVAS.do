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
***      Objetive: Control de calidad en las respuestas
********************************************************************************
*MAC
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dtafiles"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/01112018CentroEducativo_vf2.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\01112018CentroEducativo_vf2.dta, clear

********************************************************************************
************************************Arreglos************************************
********************************************************************************
/*rename de variables*/
forv i = 1/3 {
rename p4_1_1_`i' s4_1_1_`i'
rename p4_1_2_`i' s4_1_2_`i'
}
rename p4_2_1 s4_2_1
rename p4_2_2 s4_2_2

********************************************************************************
*************************************Labels*************************************
********************************************************************************
label var s0_1 "Municipio"
label var s0_2 "Distrito Educativo"
label var s0_3 "Folio"
label var s0_4 "Fecha"
label var s0_5 "Nombre del centro"
label var s0_6 "Nombre del encuestado"
label var s0_7 "Cargo del encuestado"
label var s1_1_1 "Consejo Educativo Socio Comunitario en primaria"
label var s1_1_2 "Consejo Educativo Socio Comunitario en secundaria"
label var s1_2_1 "En la CESC participan los estudiantes como miembros activos en primaria"
label var s1_2_2 "En la CESC participan los estudiantes como miembros activos en secundaria"
label var s2_1 "La Unidad Educativa cuenta con Gobierno Estudiantil de secundaria"
label var s2_2_1 "Numero de miembros hombres del Gobierno Estudiantil"
label var s2_2_2 "Numero de miembros mujeres del Gobierno Estudiantil"
label var s2_3 "Cuenta con un acta/registro de miembros del Gobierno Estudiantil"
label var s2_4 "Que actividades como Gobierno Estudiantil realizaron durante la gestion"
label var s3_1_1 "Actividad escolar para prevencion de violencia 1"
label var s3_1_2 "Actividad escolar para prevencion de violencia 2"
label var s3_1_3 "Actividad escolar para prevencion de violencia 3"
label var s3_1_4 "Actividad escolar para prevencion de violencia 4"
label var s3_1_4otro "Actividad escolar para prevencion de violencia otro"
label var s3_2 "Que temas tocan en estas actividades"
label var s3_3 "Actividades por iniciativa interna o son promovidos por una institucion externa"
label var s3_4t "Cada cuanto tiempo se realizan estas actividades (tiempo)"
label var s3_4f "Cada cuanto tiempo se realizan estas actividades (frecuencia)"
label var s4_1_1_1 "Numero de docentes primaria: culminaron curso PROFOCOM"
label var s4_1_1_2 "Numero de docentes primaria: estan cursando PROFOCOM"
label var s4_1_1_3 "Numero de docentes primaria: otro curso no PROFOCOM"
label var s4_1_2_1 "Numero de docentes secundaria: culminaron curso PROFOCOM"
label var s4_1_2_2 "Numero de docentes secundaria: estan cursando PROFOCOM"
label var s4_1_2_3 "Numero de docentes secundaria: otro curso no PROFOCOM"
label var s4_2_1 "Numero docentes primaria de la Unidad Educativa"
label var s4_2_2 "Numero docentes secundaria de la Unidad Educativa"
label var s5_1 "La Unidad Educativa tiene nivel inicial"
label var s5_2 "Cuenta con algun documento de normas"
label var s5_3_01 "Existe la norma: Condiciones basicas para un ambiente adecuado"
label var s5_3_02 "Existe la norma: Equipamiento del centro"
label var s5_3_03 "Existe la norma: Material didactico"
label var s5_3_04 "Existe la norma: Saneamiento"
label var s5_3_05 "Existe la norma: Condiciones basicas sobre recursos humanos"
label var s5_3_06 "Existe la norma: Cuidadores"
label var s5_3_07 "Existe la norma: Supervision y administracion"
label var s5_3_08 "Existe la norma: Otro personal"
label var s5_3_09 "Existe la norma: Coordinacion central"
label var s5_3_10 "Existe la norma: Practicas coercitivas disciplinarias"
label var s5_3_11 "Existe la norma: Salud"
label var s5_3_12 "Existe la norma: Control de alimentacion"
label var s5_3_13 "Existe la norma: Atencion medica"
label var s5_3_14 "Existe la norma: Vacunacion"
label var s5_3_15 "Existe la norma: Nutricion"
label var s5_3_16 "Existe la norma: Educacion"
label var s5_3_17 "Existe la norma: Actividades de aprendizaje temprano"
label var s5_3_18 "Existe la norma: Accesibilidad"
label var s5_3_19 "Existe la norma: Proteccion"
label var s5_3_20 "Existe la norma: Vulnerabilidad"
label var s5_3_21 "Existe la norma: Niños/as huerfanos/as"
label var s5_3_22 "Existe la norma: Involucramiento en actividades laborales"
label var s5_3_23 "Existe la norma: Caracteristicas del hogar/familia"
label var s5_4n_01 "Número de norma: Condiciones basicas para un ambiente adecuado"
label var s5_4n_02 "Número de norma: Equipamiento del centro"
label var s5_4n_03 "Número de norma: Material didactico"
label var s5_4n_04 "Número de norma: Saneamiento"
label var s5_4n_05 "Número de norma: Condiciones basicas sobre recursos humanos"
label var s5_4n_06 "Número de norma: Cuidadores"
label var s5_4n_07 "Número de norma: Supervision y administracion"
label var s5_4n_08 "Número de norma: Otro personal"
label var s5_4n_09 "Número de norma: Coordinacion central"
label var s5_4n_10 "Número de norma: Practicas coercitivas disciplinarias"
label var s5_4n_11 "Número de norma: Salud"
label var s5_4n_12 "Número de norma: Control de alimentacion"
label var s5_4n_13 "Número de norma: Atencion medica"
label var s5_4n_14 "Número de norma: Vacunacion"
label var s5_4n_15 "Número de norma: Nutricion"
label var s5_4n_16 "Número de norma: Educacion"
label var s5_4n_17 "Número de norma: Actividades de aprendizaje temprano"
label var s5_4n_18 "Número de norma: Accesibilidad"
label var s5_4n_19 "Número de norma: Proteccion"
label var s5_4n_20 "Número de norma: Vulnerabilidad"
label var s5_4n_21 "Número de norma: Niños/as huerfanos/as"
label var s5_4n_22 "Número de norma: Involucramiento en actividades laborales"
label var s5_4n_23 "Número de norma: Caracteristicas del hogar/familia"
label var s5_4no_01 "Nombre de la norma: Condiciones basicas para un ambiente adecuado"
label var s5_4no_02 "Nombre de la norma: Equipamiento del centro"
label var s5_4no_03 "Nombre de la norma: Material didactico"
label var s5_4no_04 "Nombre de la norma: Saneamiento"
label var s5_4no_05 "Nombre de la norma: Condiciones basicas sobre recursos humanos"
label var s5_4no_06 "Nombre de la norma: Cuidadores"
label var s5_4no_07 "Nombre de la norma: Supervision y administracion"
label var s5_4no_08 "Nombre de la norma: Otro personal"
label var s5_4no_09 "Nombre de la norma: Coordinacion central"
label var s5_4no_10 "Nombre de la norma: Practicas coercitivas disciplinarias"
label var s5_4no_11 "Nombre de la norma: Salud"
label var s5_4no_12 "Nombre de la norma: Control de alimentacion"
label var s5_4no_13 "Nombre de la norma: Atencion medica"
label var s5_4no_14 "Nombre de la norma: Vacunacion"
label var s5_4no_15 "Nombre de la norma: Nutricion"
label var s5_4no_16 "Nombre de la norma: Educacion"
label var s5_4no_17 "Nombre de la norma: Actividades de aprendizaje temprano"
label var s5_4no_18 "Nombre de la norma: Accesibilidad"
label var s5_4no_19 "Nombre de la norma: Proteccion"
label var s5_4no_20 "Nombre de la norma: Vulnerabilidad"
label var s5_4no_21 "Nombre de la norma: Niños/as huerfanos/as"
label var s5_4no_22 "Nombre de la norma: Involucramiento en actividades laborales"
label var s5_4no_23 "Nombre de la norma: Caracteristicas del hogar/familia"
label var s5_5_01 "Apuntes de la norma: Condiciones basicas para un ambiente adecuado"
label var s5_5_02 "Apuntes de la norma: Equipamiento del centro"
label var s5_5_03 "Apuntes de la norma: Material didactico"
label var s5_5_04 "Apuntes de la norma: Saneamiento"
label var s5_5_05 "Apuntes de la norma: Condiciones basicas sobre recursos humanos"
label var s5_5_06 "Apuntes de la norma: Cuidadores"
label var s5_5_07 "Apuntes de la norma: Supervision y administracion"
label var s5_5_08 "Apuntes de la norma: Otro personal"
label var s5_5_09 "Apuntes de la norma: Coordinacion central"
label var s5_5_10 "Apuntes de la norma: Practicas coercitivas disciplinarias"
label var s5_5_11 "Apuntes de la norma: Salud"
label var s5_5_12 "Apuntes de la norma: Control de alimentacion"
label var s5_5_13 "Apuntes de la norma: Atencion medica"
label var s5_5_14 "Apuntes de la norma: Vacunacion"
label var s5_5_15 "Apuntes de la norma: Nutricion"
label var s5_5_16 "Apuntes de la norma: Educacion"
label var s5_5_17 "Apuntes de la norma: Actividades de aprendizaje temprano"
label var s5_5_18 "Apuntes de la norma: Accesibilidad"
label var s5_5_19 "Apuntes de la norma: Proteccion"
label var s5_5_20 "Apuntes de la norma: Vulnerabilidad"
label var s5_5_21 "Apuntes de la norma: Niños/as huerfanos/as"
label var s5_5_22 "Apuntes de la norma: Involucramiento en actividades laborales"
label var s5_5_23 "Apuntes de la norma: Caracteristicas del hogar/familia"
label var s6_1 "Codigo del encuestador"
label var s6_2 "Observaciones"

********************************************************************************
***********************************Incidencias**********************************
********************************************************************************

************
*Seccion  0*
************
note: s0_1 s0_2 s0_3 s0_4 s0_5 s0_6 s0_7
*Nombres
global s0 "s0_1 s0_2 s0_3 s0_4 s0_5 s0_6 s0_7"
*Incidencia
cap drop inci_s0
egen inci_s0=rmiss($s0)
tempvar tp
local num: word count $s0
gen `tp'=`num'
replace inci_s0=inci_s0/`tp'
replace inci_s0=0 if `tp'==0

tab inci_s0
edit $s0 

************
*Seccion  1*
************
*nombres
global s1 "s1_1_1 s1_1_2 s1_2_1 s1_2_2"
*incidencia
capture drop inci_s1
egen inci_s1=rmiss($s1)
tempvar tp
local num: word count $s1
gen `tp'=`num'
*Flujos
local fj=1
replace inci_s1=inci_s1-`fj' if s1_1_1==3
replace `tp'=`tp'-`fj' if s1_1_1==3

replace inci_s1=inci_s1/`tp'
replace inci_s1=0 if `tp'==0

tab inci_s1
edit $s0 $s1   

************
*Seccion  2*
************
*nombres
global s2 "s2_1 s2_2_1 s2_2_2 s2_3 s2_4"
*incidencia
capture drop inci_s2
egen inci_s2=rmiss($s2)
tempvar tp
local num: word count $s2
gen `tp'=`num'
*Flujos
local fj=3
replace inci_s2=inci_s2-`fj' if s2_1==2
replace `tp'=`tp'-`fj' if s2_1==2

replace inci_s2=inci_s2/`tp'
replace inci_s2=0 if `tp'==0

tab inci_s2
edit $s0 $s2  
 
************
*Seccion  3*
************
*nombres
global s3 "s3_1_1 s3_1_2 s3_1_3 s3_1_4 s3_2 s3_3 s3_4t s3_4f"
*incidencia
capture drop inci_s3
egen inci_s3=rmiss($s3)
tempvar tp
local num: word count $s3
gen `tp'=`num'
replace inci_s3=inci_s3/`tp'
replace inci_s3=0 if `tp'==0

tab inci_s3
edit $s0 $s3  

************
*Seccion  4*
************
*nombres
global s4 "s4_1_1_1 s4_1_1_2 s4_1_1_3 s4_1_2_1 s4_1_2_2 s4_1_2_3 s4_2_1 s4_2_2"
*incidencia
cap drop inci_s4
egen inci_s4=rmiss($s4)
tempvar tp
local num: word count $s4
gen `tp'=`num'
replace inci_s4=inci_s4/`tp'
replace inci_s4=0 if `tp'==0
tab inci_s4
edit $s0 $s4  

************
*Seccion  5*
************
*nombres
global s5 "s5_1 s5_2"
*incidencia
cap drop inci_s5
egen inci_s5=rmiss($s5)
tempvar tp
local num: word count $s5
gen `tp'=`num'
*Flujos
local fj=1
replace inci_s5=inci_s5-`fj' if s5_1==2
replace `tp'=`tp'-`fj' if s5_1==2

replace inci_s5=inci_s5/`tp'
replace inci_s5=0 if `tp'==0

tab inci_s5
edit $s0 $s5  

*********************
* Incidencia global *
*********************
cap drop inci
egen inci=rowmean(inci_s1 inci_s2 inci_s3 inci_s4 inci_s5)
tab inci
drop inci*
saveold $dta/CentroEducativo.dta, replace
