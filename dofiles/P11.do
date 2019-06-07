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
***      Objetive: INDICADOR P11
********************************************************************************
clear all 
global do "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Desktop\BASE_DE_DATOS\ENDSA"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
global out "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\outfiles"
use $dta/EDSA16_HOGAR.dta, clear

*Folio unico de la persona
cap drop folio 
gen folio=string(id)+"-"+string(nro)
duplicates report folio

*Edad
rename hs03_0003_1 edad 

*Carnet de identidad o registro de nacimiento
cap drop registro
gen registro=(hs03_0020<=2) 

*Registro oportuno
cap drop IP11
gen IP11=(registro==1) if edad==0


*TABULADO
tab IP11 [aw=ponderadorh] 
tab area IP11 [aw=ponderadorh], nofreq row

*COEFICIENTE DE VARIACION
tab IP11 [aw=ponderadorh] 
svyset upm [iw=ponderadorh], strata(estrato)
svy: proportion IP11   
estat cv

tab area IP11 [aw=ponderadorh], nofreq row
svy: proportion IP11, over(area)   
estat cv


 