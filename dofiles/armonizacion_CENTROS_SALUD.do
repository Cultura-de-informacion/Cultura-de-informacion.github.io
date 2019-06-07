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
use $dta/CentroSalud_vf6.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\CentroSalud_vf6.dta, clear

***********
*Seccion 0*
***********
rename s0_1 muni
label var muni "Municipio"

rename s0_2 rsalud
label var rsalud "Red de Salud"

rename s0_3 folio
label var folio "Folio"

rename s0_4ea nombre_EA
label var nombre_EA "Nombre Centro El Alto"

rename s0_4i nombre_IN
label var nombre_IN "Nombre Centro Independencia"

rename s0_5 nombre
label var nombre "Nombre del encuestado"

rename s2_2 observaciones
label var observaciones ""

rename s2_1 coden
label var coden "Codigo encuestador"

drop s0_6 s2_3 fecha

***********
*Seccion 1*
***********
*Verificar estacion de lavamanos
forv i=1/11{
cap drop s1_4_`i'
gen s1_4_`i'=(strpos(s1_4,"`i'")>0)	
}

*Fuentes mejoradas de agua
note: tubería o pileta pública, pozo entubado/de perforación, /*
*/    pozo excavado protegido, vertiente protegida, y agua de lluvia

cap drop magua
gen magua=(s1_1<=7)
replace magua=0 if s1_1==5
replace magua=. if s1_1==.
label var magua "Fuente mejorada de agua"

*Instalaciones mejoradas de saneamiento
note: alcantarillado, tanque séptico, descarga hidráulica con cisterna /*
*/    o manual a un pozo, baño seco ecológico, la letrina de pozo 

cap drop instal
gen instal=(s1_3<=6) if s1_3!=.
replace instal=0 if s1_2==2
label var instal "Fuente mejoradas de saneamiento"


*Estaciones de lavado de manos
note: Lavamanos, lavanderías, grifo, o cualquier alternativa que cuenten /*
*/    con agua corriente y jabón para el lavado de manos

cap drop lvmanos_1
gen lvmanos_1=0
replace lvmanos_1=1 if s1_4_1==1
replace lvmanos_1=1 if s1_4_3==1
replace lvmanos_1=1 if s1_4_5==1
replace lvmanos_1=1 if s1_4_7==1
replace lvmanos_1=1 if s1_4_8==1
replace lvmanos_1=1 if s1_4_9==1
replace lvmanos_1=1 if s1_4_10==1
label var lvmanos_1 "Estacion limpia"

cap drop lvmanos_2
gen lvmanos_2=0
replace lvmanos_2=1 if s1_4_2==1
replace lvmanos_2=1 if s1_4_4==1
replace lvmanos_2=1 if s1_4_6==1
replace lvmanos_2=1 if s1_4_11==1
label var lvmanos_2 "Estacion no limpia"

cap drop _lvmanos
gen _lvmanos=(s1_4!="")
label var _lvmanos "Cuenta con estacion de lava manos"


order folio muni rsalud nombre_* nombre magua instal lvmanos* _lvmanos observaciones coden
keep folio muni rsalud nombre_* nombre magua instal lvmanos* _lvmanos observaciones coden
saveold $dta/Salud_armon.dta, replace


