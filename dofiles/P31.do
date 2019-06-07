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
***      Objetive: INDICADOR P31
********************************************************************************
*MAC
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Desktop/BASE_DE_DATOS/ENDSA"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/2016_MUJER-antecedentes.dta, clear

*HP
clear all 
global do "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Desktop\BASE_DE_DATOS\ENDSA"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\2016_MUJER-antecedentes.dta, clear


*Folio unico de la persona
cap drop folio 
gen folio=string(id)+"-"+string(nro)
duplicates report folio

*Violencia sexual marital a lo largo de la vida
capture drop msexv
gen msexv=0
replace msexv=1 if ms11_1107_e==1
replace msexv=1 if ms11_1107_e==2
replace msexv=1 if ms11_1107_e==3 
replace msexv=1 if ms11_1107_f==1
replace msexv=1 if ms11_1107_f==2
replace msexv=1 if ms11_1107_f==3 
replace msexv=. if ms11_1107_e==.|ms11_1107_f==.


*Violencia sexual no marital
capture drop nmsexv 
gen nmsexv=(ms11_1123==1) /*if ms11_1123!=. */

*Estado marital
cap drop civil
gen civil=0
replace civil=1 if (ms06_0601==1|ms06_0601==2)
replace civil=1 if (ms06_0602==1|ms06_0602==2)
 
*Edad
rename ms01_0110 edad

*Grupos de edad
cap drop gedad
gen gedad=1 if edad>=15 & edad<=19
replace gedad=2 if edad>=20 & edad<=24
replace gedad=3 if edad>=25 & edad<=29
replace gedad=4 if edad>=30 & edad<=34
replace gedad=5 if edad>=35 & edad<=39
replace gedad=6 if edad>=40 & edad<=44
replace gedad=7 if edad>=45 & edad<=49
label define gedad 1 "15-19"
label define gedad 2 "20-24", add
label define gedad 3 "25-29", add
label define gedad 4 "30-34", add
label define gedad 5 "35-39", add
label define gedad 6 "40-44", add
label define gedad 7 "45-49", add
label val gedad gedad

*Departamento
cap drop depto
gen depto=departamento
label define depto 1 "CH"
label define depto 2 "LP", add
label define depto 3 "CB", add
label define depto 4 "OR", add
label define depto 5 "PT", add
label define depto 6 "TJ", add
label define depto 7 "SC", add
label define depto 8 "BN", add
label define depto 9 "PA", add
label val depto depto

cap drop pdepto
gen pdepto=1 if depto==7
replace pdepto=2 if depto==2
replace pdepto=3 if depto==3
replace pdepto=4 if depto==9
label define pdepto 1 "SC"
label define pdepto 2 "LP", add
label define pdepto 3 "CB", add
label define pdepto 4 "PA", add
label val pdepto pdepto

****************
*INDICADOR IP31*
****************
cap drop IP31
gen IP31=(msexv==1|nmsexv==1) if edad>=15 & edad<=49
replace IP31=. if msexv==. & nmsexv==.  

*General mujeres alguna vez unidas
tab IP31 [aw=ponderadorm] if civil==1  
svyset upm [iw=ponderadorm], strata(estrato)
svy: proportion IP31  if civil==1 
estat cv

tab pdepto IP31 [aw=ponderadorm] if civil==1, nofreq row
svy: proportion IP31 if civil==1, over(pdepto)  
estat cv

tab gedad IP31 [aw=ponderadorm] if civil==1, nofreq row
svy: proportion IP31 if civil==1, over(gedad)  
estat cv

*General con mujeres solteras
tab IP31 [aw=ponderadorm]  
svy: proportion IP31  
estat cv

tab pdepto IP31 [aw=ponderadorm], nofreq row
svy: proportion IP31, over(pdepto)
estat cv

tab gedad IP31 [aw=ponderadorm], nofreq row
svy: proportion IP31, over(gedad)
estat cv

*Violencia marital mujeres alguna vez unidas
tab msexv [aw=ponderadorm] if civil==1 
svy: proportion msexv  if civil==1 
estat cv

tab pdepto msexv [aw=ponderadorm] if civil==1 , nofreq row
svy: proportion msexv if civil==1, over(pdepto) 
estat cv

tab gedad msexv [aw=ponderadorm] if civil==1 , nofreq row
svy: proportion msexv if civil==1, over(gedad) 
estat cv

*Violencia marital con mujeres solteras
tab msexv [aw=ponderadorm]  
svy: proportion msexv   
estat cv

tab pdepto msexv [aw=ponderadorm], nofreq row
svy: proportion msexv, over(pdepto)   
estat cv

tab gedad msexv [aw=ponderadorm], nofreq row
svy: proportion msexv, over(gedad)    
estat cv

*Violencia no marital mujeres alguna vez unidas
tab nmsexv [aw=ponderadorm] if civil==1 
svy: proportion nmsexv  if civil==1 
estat cv

tab pdepto nmsexv [aw=ponderadorm] if civil==1 , nofreq row
svy: proportion nmsexv  if civil==1, over(pdepto) 
estat cv

tab gedad nmsexv [aw=ponderadorm] if civil==1 , nofreq row
svy: proportion nmsexv  if civil==1, over(gedad) 
estat cv

*Violencia no marital con mujeres solteras
tab nmsexv [aw=ponderadorm] 
svy: proportion nmsexv   
estat cv
 
tab pdepto nmsexv [aw=ponderadorm], nofreq row
svy: proportion nmsexv, over(pdepto)   
estat cv

tab gedad nmsexv [aw=ponderadorm], nofreq row
svy: proportion nmsexv, over(gedad)   
estat cv
