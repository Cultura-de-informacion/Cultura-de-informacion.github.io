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
***      Objetive: Indicadores DIPI
********************************************************************************
*MAC
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dtafiles"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/DIPI_armon.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\DIPI_armon.dta, clear


**************************************************
*INDICADOR ESTACION DE AGUA DIPI-CENTROS DE SALUD*
**************************************************
use $dta/DIPI_armon.dta, clear
drop n* 
append using $dta/Salud_armon.dta, force

cap drop IR13
gen IR13=(magua==1 & instal==1 & _lvmanos==1)
label var IR13 "Instalaciones mejoradas de ASeH"

*Tablas
cap drop tipo
gen tipo=.
replace tipo=1 if type_dipi==.
replace tipo=2 if rsalud==.

label define tipo 1 "Centro Salud"
label define tipo 2 "DIPI", add
label val tipo tipo

*DIPI EL ALTO
tab IR13 if tipo==2 & distredu==1
tab magua if tipo==2 & distredu==1
tab instal if tipo==2 & distredu==1
tab _lvmanos if tipo==2 & distredu==1

*Centro de Salud EL ALTO
tab IR13 if tipo==1 & rsalud==1
tab magua if tipo==1 & rsalud==1
tab instal if tipo==1 & rsalud==1
tab _lvmanos if tipo==1 & rsalud==1

*DIPI INDEPENDENCIA
tab IR13 if tipo==2 & distredu==2
tab magua if tipo==2 & distredu==2
tab instal if tipo==2 & distredu==2
tab _lvmanos if tipo==2 & distredu==2

*Centro de Salud INDEPENDENCIA
tab IR13 if tipo==1 & rsalud==2
tab magua if tipo==1 & rsalud==2
tab instal if tipo==1 & rsalud==2
tab _lvmanos if tipo==1 & rsalud==2
 
******************************************* 
*INDICADOR NORMAS DIPI-UNIDADES EDUCATIVAS*
******************************************* 
use $dta/UnidadesEducativas_armon.dta, clear
keep if _flagDIPI==1
keep folio muni distredu n* observaciones coden _flagDIPI
append using $dta/DIPI_armon.dta, force

cap drop IR14
gen IR14=(normas_1>=1 & normas_2>=1 & normas_3>=1 & normas_4>=1 & normas_5>=1)
label var IR14 "Estandares de calidad"

forv i=1/5{
cap drop normas`i'
gen normas`i'=(normas_`i'>0) 
}

*El Alto Unidad Educativa
tab IR14    if muni==1 & _flagDIPI==1
tab normas1 if muni==1 & _flagDIPI==1
tab normas2 if muni==1 & _flagDIPI==1
tab normas3 if muni==1 & _flagDIPI==1
tab normas4 if muni==1 & _flagDIPI==1
tab normas5 if muni==1 & _flagDIPI==1

*Independencia Unidad Educativa
tab IR14    if muni==2 & _flagDIPI==1
tab normas1 if muni==2 & _flagDIPI==1
tab normas2 if muni==2 & _flagDIPI==1
tab normas3 if muni==2 & _flagDIPI==1
tab normas4 if muni==2 & _flagDIPI==1
tab normas5 if muni==2 & _flagDIPI==1

*El Alto DIPI
tab IR14    if muni==1 & _flagDIPI==.
tab normas1 if muni==1 & _flagDIPI==.
tab normas2 if muni==1 & _flagDIPI==.
tab normas3 if muni==1 & _flagDIPI==.
tab normas4 if muni==1 & _flagDIPI==.
tab normas5 if muni==1 & _flagDIPI==.

*Independencia DIPI
tab IR14    if muni==2 & _flagDIPI==.
tab normas1 if muni==2 & _flagDIPI==.
tab normas2 if muni==2 & _flagDIPI==.
tab normas3 if muni==2 & _flagDIPI==.
tab normas4 if muni==2 & _flagDIPI==.
tab normas5 if muni==2 & _flagDIPI==.






