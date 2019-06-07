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
use $dta/01112018CentroSalud_vf2.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\01102018CentroSalud_vf2.dta, clear

********************************************************************************
*************************************Arreglo************************************
********************************************************************************
/*borrar variable de fecha*/
drop s0_6 

/*borrar sello de validacion*/
drop s2_3 

/*una sola variable de nombres*/
cap drop s0_4 
gen s0_4=s0_4ea if s0_1==1
replace s0_4=s0_4i if s0_1==2
drop s0_4ea s0_4i

/*ordenar variables*/
order formulario fecha s0_1 s0_2 s0_3 s0_4 s0_5 s1_* s2_*

********************************************************************************
*************************************Label**************************************
********************************************************************************
label var s0_1 "Municipio"
label var s0_2 "Red de salud"
label var s0_3 "Folio"
label var s0_4 "Nombre del centro"
label var s0_5 "Nombre del encuestado"
label var s1_1 "Principalmente el agua para uso de las personas proviene de"
label var s1_2 "Tiene baño, servicio sanitario o letrina"
label var s1_3 "El baño, servicio sanitario o letrina tiene desagüe a"
label var s1_4 "Verficiar la estacion de lavado de mano"
label var s2_1 "Codigo encuestador"
label var s2_2 "Observaciones"

********************************************************************************
***********************************Incidencias**********************************
********************************************************************************

************
*Seccion  0*
************
note: s0_1 s0_2 s0_3 s0_4 s0_5  
*Nombres
global s0 "s0_1 s0_2 s0_3 s0_4 s0_5"
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
global s1 "s1_1 s1_2 s1_3 s1_4"
*incidencia
capture drop inci_s1
egen inci_s1=rmiss($s1)
tempvar tp
local num: word count $s1
gen `tp'=`num'
replace inci_s1=inci_s1/`tp'
replace inci_s1=0 if `tp'==0

tab inci_s1
edit $s0 $s1 

*********************
* Incidencia global *
*********************
cap drop inci
egen inci=rowmean(inci_s0 inci_s1)
tab inci
drop inci*
saveold $dta/CentroSalud.dta, replace


 

