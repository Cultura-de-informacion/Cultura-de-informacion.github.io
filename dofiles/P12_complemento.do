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
***      Objetive: INDICADOR P12-Complemento
********************************************************************************
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Desktop/BASE_DE_DATOS/ESNUT2012"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/BJA_Embarazos_Recode_f, clear

*Folio unico de la persona
cap drop folio_hijo
gen folio_hijo=string(folio)+"-"+string(id)+"-"+string(id_hijo)
keep if embidx==1
duplicates report folio_hijo
keep folio* p15_* p16_14 p16_18 p16_13 estrato

saveold $dta/BJA_hijos, replace

********************************************************************************
use $dta/BJA_Ninos_Recode_f, clear

*Folio unico de la persona
cap drop folio_hijo
gen folio_hijo=string(folio)+"-"+string(id_mama)+"-"+string(id)
duplicates report folio_hijo

*Edad en meses
cap drop edadd
gen edadd=p18_2a
label var edadd "Edad en meses"

merge 1:m folio_hijo using $dta/BJA_hijos
keep if _merge==3
saveold $dta/IP12_complemento.dta, replace

********************************************************************************
use $dta/IP12_complemento.dta, clear

*Nos quedamos con los niños de interes
keep if edadd<6
keep if p15_8==1
keep folio* p15_* p16_* p18_10 p18_11 depto area p1_2 weight edadd upm estrato

*Lactancia
cap drop lact1
gen lact1=(p15_1==1)  

*No consumio otros alimentos
cap drop noalim
gen noalim=(p15_7>5)
replace noalim=. if p15_7==. 

*Control
cap drop control
gen control=(p15_9==2)

cap drop control2
gen control2=(p15_4==1)

************************
*INDICADOR DE LACTANCIA*
************************
cap drop IP12
gen IP12=(lact1==1 & noalim==1)
replace IP12=0 if control==1
replace IP12=0 if control2==1

svyset upm [pw=weight], strata(estrato)

*Nacional 
tab IP12 [aw=weight]
svy: proportion IP12 
estat cv

*Departamental
cap drop pdepto
gen pdepto=depto
label define pdepto 1 "CH"
label define pdepto 2 "LP", add
label define pdepto 3 "CB", add
label define pdepto 4 "OR", add
label define pdepto 5 "PT", add
label define pdepto 6 "TJ", add
label define pdepto 7 "SC", add
label define pdepto 8 "BN", add
label define pdepto 9 "PA", add
label val pdepto pdepto

tab pdepto IP12 [aw=weight], nofreq row 
svy: proportion IP12, over(pdepto)
estat cv

*Area
tab area IP12 [aw=weight], nofreq row 
svy: proportion IP12, over(area)
estat cv


*Sexo
cap drop sexo
gen sexo=p1_2
label define sexo 1 "Niño"
label define sexo 2 "Niña", add
label val sexo sexo

tab sexo IP12 [aw=weight], nofreq row 
svy: proportion IP12, over(sexo)
estat cv










