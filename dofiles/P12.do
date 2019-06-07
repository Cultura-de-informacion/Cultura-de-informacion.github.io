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
***      Objetive: INDICADOR P12 
********************************************************************************
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Desktop/BASE_DE_DATOS/ENDSA"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/2016_HOGAR, clear

*Identificacion de la madre dentro del hogar
cap drop id_mom
gen id_mom=hs03_0006_3
replace id_mom=. if id_mom==997

*Folio del hijo vinculado a la madre
cap drop folio_mom
gen folio_mom=string(id)+"-"+string(id_mom)
duplicates report folio_mom

*Edad en dias
cap drop edad_a
gen edad_a=dv_00484c - hs03_0003_2c if hs03_0003_2b<=dv_00484b 
replace edad_a=dv_00484c - hs03_0003_2c-1 if hs03_0003_2b>dv_00484b 

cap drop edad_m
gen edad_m=hs03_0003_2b if hs03_0003_2b<dv_00484b
replace edad_m=12-hs03_0003_2b+5 if hs03_0003_2b>dv_00484b
replace edad_m=0 if edad_m==.

cap drop edadd
gen edadd=(edad_a*12)+edad_m
label var edadd "Edad en meses"

*Hogares con niños menores a 180 dias
cap drop flag_
gen flag_=1 if edadd<6 & edadd!=.
keep if flag_==1 /*nos quedamos con niños de interes*/

duplicates drop folio_mom, force
rename hs03_0005 sexo
keep id upm nro edad* dv_* hs03_0003* sexo id_mom flag_ folio_mom area ponderadorh estrato
saveold $dta/hijo.dta, replace

********************************************************************************
use $dta/2016_MUJER-parto-vacc.dta, clear
cap drop folio_mom
gen folio_mom=string(id)+"-"+string(nro)
keep if ms02_0215a==1 /*el ultimo hijo*/

duplicates report folio_mom 
keep id nro ms04_0404 ms04_0452 ms04_045* ms04_046* /*
*/   departamento area ponderador* folio_mom upm estrato

********************************************************************************
merge 1:1 folio_mom using $dta/hijo.dta
keep if _merge==3
duplicates report folio_mom 
saveold $dta/IP12.dta, replace

********************************************************************************
use $dta/IP12.dta, clear

*Lactancia
cap drop lact1
gen lact1=(ms04_0452==1)  

*No consumio liquidos la noche anterior
cap drop noliquid
gen noliquid=(ms04_0461==2)
replace noliquid=. if ms04_0461==. 

*Control
cap drop control
gen control=(ms04_0462==1 & ms04_0462_1<6)

************************
*INDICADOR DE LACTANCIA*
************************
cap drop IP12
gen IP12=(lact1==1 & noliquid==1)
replace IP12=0 if control==1
replace IP12=0 if ms04_0455b==1 /*leche de vaca*/
replace IP12=0 if ms04_0455i==1 /*te infusion*/


*Nacional 
tab IP12 [aw=ponderadorm]
svyset upm [iw=ponderadorm], strata(estrato)
svy: proportion IP12  
estat cv

*Departamental
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

tab depto IP12 [aw=ponderadorm], nofreq row 
svy: proportion IP12, over(depto) 
estat cv

*Area
tab area IP12 [aw=ponderadorm], nofreq row 
svy: proportion IP12, over(area) 
estat cv

*Sexo
label define sexo 1 "Niño"
label define sexo 2 "Niña", add
label val sexo sexo

tab sexo IP12 [aw=ponderadorm], nofreq row 
svy: proportion IP12, over(sexo) 
estat cv















