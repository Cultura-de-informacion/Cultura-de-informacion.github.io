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
use $dta/29102018CentroInfantil_vf.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\29102018CentroInfantil_vf.dta, clear

********************************************************************************
*************************************Labels*************************************
********************************************************************************
label var s0_1 "Municipio"
label var s0_2 "Distrito"
label var s0_3 "Folio"
label var s0_4 "Fecha"
label var s0_5 "Tipo de establecimiento"
label var s0_6 "Nombre del centro"
label var s0_7 "Nombre del encuestado"
label var s0_8 "Cargo del encuestado"
label var s0_9 "Codigo del encuestador"
label var s0_10 "Observaciones"
label var s1_1_01 "Existe la norma: Condiciones basicas para un ambiente adecuado"
label var s1_1_02 "Existe la norma: Equipamiento del centro"
label var s1_1_03 "Existe la norma: Material didactico"
label var s1_1_04 "Existe la norma: Saneamiento"
label var s1_1_05 "Existe la norma: Condiciones basicas sobre recursos humanos"
label var s1_1_06 "Existe la norma: Cuidadores"
label var s1_1_07 "Existe la norma: Supervision y administracion"
label var s1_1_08 "Existe la norma: Otro personal"
label var s1_1_09 "Existe la norma: Coordinacion central"
label var s1_1_10 "Existe la norma: Practicas coercitivas disciplinarias"
label var s1_1_11 "Existe la norma: Salud"
label var s1_1_12 "Existe la norma: Control de alimentacion"
label var s1_1_13 "Existe la norma: Atencion medica"
label var s1_1_14 "Existe la norma: Vacunacion"
label var s1_1_15 "Existe la norma: Nutricion"
label var s1_1_16 "Existe la norma: Educacion"
label var s1_1_17 "Existe la norma: Actividades de aprendizaje temprano"
label var s1_1_18 "Existe la norma: Accesibilidad"
label var s1_1_19 "Existe la norma: Proteccion"
label var s1_1_20 "Existe la norma: Vulnerabilidad"
label var s1_1_21 "Existe la norma: Niños/as huerfanos/as"
label var s1_1_22 "Existe la norma: Involucramiento en actividades laborales"
label var s1_1_23 "Existe la norma: Caracteristicas del hogar/familia"
label var s1_2_1_01 "Número de norma: Condiciones basicas para un ambiente adecuado"
label var s1_2_1_02 "Número de norma: Equipamiento del centro"
label var s1_2_1_03 "Número de norma: Material didactico"
label var s1_2_1_04 "Número de norma: Saneamiento"
label var s1_2_1_05 "Número de norma: Condiciones basicas sobre recursos humanos"
label var s1_2_1_06 "Número de norma: Cuidadores"
label var s1_2_1_07 "Número de norma: Supervision y administracion"
label var s1_2_1_08 "Número de norma: Otro personal"
label var s1_2_1_09 "Número de norma: Coordinacion central"
label var s1_2_1_10 "Número de norma: Practicas coercitivas disciplinarias"
label var s1_2_1_11 "Número de norma: Salud"
label var s1_2_1_12 "Número de norma: Control de alimentacion"
label var s1_2_1_13 "Número de norma: Atencion medica"
label var s1_2_1_14 "Número de norma: Vacunacion"
label var s1_2_1_15 "Número de norma: Nutricion"
label var s1_2_1_16 "Número de norma: Educacion"
label var s1_2_1_17 "Número de norma: Actividades de aprendizaje temprano"
label var s1_2_1_18 "Número de norma: Accesibilidad"
label var s1_2_1_19 "Número de norma: Proteccion"
label var s1_2_1_20 "Número de norma: Vulnerabilidad"
label var s1_2_1_21 "Número de norma: Niños/as huerfanos/as"
label var s1_2_1_22 "Número de norma: Involucramiento en actividades laborales"
label var s1_2_1_23 "Número de norma: Caracteristicas del hogar/familia"
label var s1_2_2_01 "Nombre de la norma: Condiciones basicas para un ambiente adecuado"
label var s1_2_2_02 "Nombre de la norma: Equipamiento del centro"
label var s1_2_2_03 "Nombre de la norma: Material didactico"
label var s1_2_2_04 "Nombre de la norma: Saneamiento"
label var s1_2_2_05 "Nombre de la norma: Condiciones basicas sobre recursos humanos"
label var s1_2_2_06 "Nombre de la norma: Cuidadores"
label var s1_2_2_07 "Nombre de la norma: Supervision y administracion"
label var s1_2_2_08 "Nombre de la norma: Otro personal"
label var s1_2_2_09 "Nombre de la norma: Coordinacion central"
label var s1_2_2_10 "Nombre de la norma: Practicas coercitivas disciplinarias"
label var s1_2_2_11 "Nombre de la norma: Salud"
label var s1_2_2_12 "Nombre de la norma: Control de alimentacion"
label var s1_2_2_13 "Nombre de la norma: Atencion medica"
label var s1_2_2_14 "Nombre de la norma: Vacunacion"
label var s1_2_2_15 "Nombre de la norma: Nutricion"
label var s1_2_2_16 "Nombre de la norma: Educacion"
label var s1_2_2_17 "Nombre de la norma: Actividades de aprendizaje temprano"
label var s1_2_2_18 "Nombre de la norma: Accesibilidad"
label var s1_2_2_19 "Nombre de la norma: Proteccion"
label var s1_2_2_20 "Nombre de la norma: Vulnerabilidad"
label var s1_2_2_21 "Nombre de la norma: Niños/as huerfanos/as"
label var s1_2_2_22 "Nombre de la norma: Involucramiento en actividades laborales"
label var s1_2_2_23 "Nombre de la norma: Caracteristicas del hogar/familia"
label var s1_3_01 "Apuntes de la norma: Condiciones basicas para un ambiente adecuado"
label var s1_3_02 "Apuntes de la norma: Equipamiento del centro"
label var s1_3_03 "Apuntes de la norma: Material didactico"
label var s1_3_04 "Apuntes de la norma: Saneamiento"
label var s1_3_05 "Apuntes de la norma: Condiciones basicas sobre recursos humanos"
label var s1_3_06 "Apuntes de la norma: Cuidadores"
label var s1_3_07 "Apuntes de la norma: Supervision y administracion"
label var s1_3_08 "Apuntes de la norma: Otro personal"
label var s1_3_09 "Apuntes de la norma: Coordinacion central"
label var s1_3_10 "Apuntes de la norma: Practicas coercitivas disciplinarias"
label var s1_3_11 "Apuntes de la norma: Salud"
label var s1_3_12 "Apuntes de la norma: Control de alimentacion"
label var s1_3_13 "Apuntes de la norma: Atencion medica"
label var s1_3_14 "Apuntes de la norma: Vacunacion"
label var s1_3_15 "Apuntes de la norma: Nutricion"
label var s1_3_16 "Apuntes de la norma: Educacion"
label var s1_3_17 "Apuntes de la norma: Actividades de aprendizaje temprano"
label var s1_3_18 "Apuntes de la norma: Accesibilidad"
label var s1_3_19 "Apuntes de la norma: Proteccion"
label var s1_3_20 "Apuntes de la norma: Vulnerabilidad"
label var s1_3_21 "Apuntes de la norma: Niños/as huerfanos/as"
label var s1_3_22 "Apuntes de la norma: Involucramiento en actividades laborales"
label var s1_3_23 "Apuntes de la norma: Caracteristicas del hogar/familia"
label var s2_1 "Principalmente el agua para uso de las personas proviene de"
label var s2_2 "Tiene baño, servicio sanitario o letrina"
label var s2_3 "El baño, servicio sanitario o letrina tiene desagüe a"
label var s2_4 "Verficiar la estacion de lavado de mano"

********************************************************************************
***********************************Incidencias**********************************
********************************************************************************

************
*Seccion  0*
************
note: s0_1 s0_2 s0_3 s0_4 s0_5 s0_6 s0_7 s0_8
*Nombres
global s0 "s0_1 s0_2 s0_3 s0_4 s0_5 s0_6 s0_7 s0_8"
*Incidencia
cap drop inci_s0
egen inci_s0=rmiss($s0)
tempvar tp
local num: word count $s0
gen `tp'=`num'
replace inci_s0=inci_s0/`tp'
replace inci_s0=0 if `tp'==0
tab inci_s0
 
************
*Seccion  1*
************
*nombres
global s1 "s1_1_01 s1_1_02 s1_1_03 s1_1_04 s1_1_05 s1_1_06 s1_1_07 s1_1_08 s1_1_09 s1_1_10 s1_1_11 s1_1_12 s1_1_13 s1_1_14 s1_1_15 s1_1_16 s1_1_17 s1_1_18 s1_1_19 s1_1_20 s1_1_21 s1_1_22 s1_1_23"
*incidencia
capture drop inci_s1
egen inci_s1=rmiss($s1)
tempvar tp
local num: word count $s1
gen `tp'=`num'
replace inci_s1=inci_s1/`tp'
replace inci_s1=0 if `tp'==0

tab inci_s1
edit $s0 $s1 if inci_s1>0

************
*Seccion  2*
************
*nombres
global s2 "s2_1 s2_2 s2_3 s2_4"
*incidencia
capture drop inci_s2
egen inci_s2=rmiss($s2)
tempvar tp
local num: word count $s2
gen `tp'=`num'
*Flujos
local fj=1
replace inci_s2=inci_s2-`fj' if s2_2==2
replace `tp'=`tp'-`fj' if s2_2==2

replace inci_s2=inci_s2/`tp'
replace inci_s2=0 if `tp'==0

tab inci_s2
edit $s0 $s2 if inci_s2>0

*********************
* Incidencia global *
*********************
cap drop inci
egen inci=rowmean(inci_s0 inci_s1 inci_s2)
tab inci
drop inci*

saveold $dta/CentroInfantil.dta, replace

