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
***      Objetive: INDICADOR P31-Complemento
********************************************************************************
clear all
global sw_mw=1   //1 para trabjo en MAC
                 //0 para trabjo Windows
*set
if $sw_mw==1 {         
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Desktop/BASE_DE_DATOS/Encuesta_violencia" 
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/EPCVCM_Solteras.dta, clear
}
merge 1:m folio nro using $dta/EPCVCM_Persona.dta, gen(merge1)
keep if merge1==3

******************
*Violencia sexual*
******************
*En los 12 ultimos meses
cap drop v1_sexual
gen v1_sexual=0
replace v1_sexual=1 if (S6_1C_1<=3) 
replace v1_sexual=1 if (S6_1C_2<=3)
replace v1_sexual=1 if (S6_1C_3<=3)
replace v1_sexual=1 if (S6_1C_4<=3)
replace v1_sexual=1 if (S6_1C_5<=3)
replace v1_sexual=1 if (S6_1C_6<=3)
replace v1_sexual=1 if (S6_1C_7<=3)
replace v1_sexual=. if S6_1C_1==. & S6_1C_2==. & S6_1C_3==. /*
*/ & S6_1C_4==. & S6_1C_5==. & S6_1C_1==. & S6_1C_7==.


*A lo largo de su vida
cap drop v_sexual
gen v_sexual=0
replace v_sexual=1 if (S6_01_1<=3) 
replace v_sexual=1 if (S6_01_2<=3)
replace v_sexual=1 if (S6_01_3<=3)
replace v_sexual=1 if (S6_01_4<=3)
replace v_sexual=1 if (S6_01_5<=3)
replace v_sexual=1 if (S6_01_6<=3)
replace v_sexual=1 if (S6_01_7<=3)
replace v_sexual=. if S6_01_1==. & S6_01_2==. & S6_01_3==. /*
*/ & S6_01_4==. & S6_01_5==. & S6_01_1==. & S6_01_7==.


rename s2_03 edad
keep folio nro depto area factor* v_* v1* edad estrato upm

saveold $dta/solteras_v2.dta, replace

********************************************************************************
use $dta/EPCVCM_Separadas.dta, clear

merge 1:m folio nro using $dta/EPCVCM_Persona.dta, gen(merge1)
keep if merge1==3

******************
*Violencia sexual*
******************
*En los ultimos 12 meses
cap drop v1_sexual
gen v1_sexual=0
replace v1_sexual=1 if (S6_1C_1<=3) 
replace v1_sexual=1 if (S6_1C_2<=3)
replace v1_sexual=1 if (S6_1C_3<=3)
replace v1_sexual=1 if (S6_1C_4<=3)
replace v1_sexual=1 if (S6_1C_5<=3)
replace v1_sexual=1 if (S6_1C_6<=3)
replace v1_sexual=1 if (S6_1C_7<=3)
replace v1_sexual=. if S6_1C_1==. & S6_1C_2==. & S6_1C_3==. /*
*/ & S6_1C_4==. & S6_1C_5==. & S6_1C_1==. & S6_1C_7==.
tab v1_sexual [w=factorm]

*A lo largo de su vida
cap drop v_sexual
gen v_sexual=0
replace v_sexual=1 if (S6_01_1<=3) 
replace v_sexual=1 if (S6_01_2<=3)
replace v_sexual=1 if (S6_01_3<=3)
replace v_sexual=1 if (S6_01_4<=3)
replace v_sexual=1 if (S6_01_5<=3)
replace v_sexual=1 if (S6_01_6<=3)
replace v_sexual=1 if (S6_01_7<=3)
replace v_sexual=. if S6_01_1==. & S6_01_2==. & S6_01_3==. /*
*/ & S6_01_4==. & S6_01_5==. & S6_01_1==. & S6_01_7==.


rename s2_03 edad
keep folio nro depto area factor* v_* v1* edad  estrato upm

saveold $dta/separadas_v2.dta, replace

********************************************************************************
use $dta/EPCVCM_Casadas.dta, clear

merge 1:m folio nro using $dta/EPCVCM_Persona.dta, gen(merge1)
keep if merge1==3

******************
*Violencia sexual*
******************
*En los ultimos 12 meses
cap drop v1_sexual
gen v1_sexual=0
replace v1_sexual=1 if (S6_1C_1<=3) 
replace v1_sexual=1 if (S6_1C_2<=3)
replace v1_sexual=1 if (S6_1C_3<=3)
replace v1_sexual=1 if (S6_1C_4<=3)
replace v1_sexual=1 if (S6_1C_5<=3)
replace v1_sexual=1 if (S6_1C_6<=3)
replace v1_sexual=1 if (S6_1C_7<=3)
replace v1_sexual=. if S6_1C_1==. & S6_1C_2==. & S6_1C_3==. /*
*/ & S6_1C_4==. & S6_1C_5==. & S6_1C_1==. & S6_1C_7==.
tab v1_sexual [w=factorm]

*A lo largo de su vida
cap drop v_sexual
gen v_sexual=0
replace v_sexual=1 if (S6_01_1<=3) 
replace v_sexual=1 if (S6_01_2<=3)
replace v_sexual=1 if (S6_01_3<=3)
replace v_sexual=1 if (S6_01_4<=3)
replace v_sexual=1 if (S6_01_5<=3)
replace v_sexual=1 if (S6_01_6<=3)
replace v_sexual=1 if (S6_01_7<=3)
replace v_sexual=. if S6_01_1==. & S6_01_2==. & S6_01_3==. /*
*/ & S6_01_4==. & S6_01_5==. & S6_01_1==. & S6_01_7==.


rename s2_03 edad
keep folio nro depto area factor* v_* v1* edad  estrato upm

saveold $dta/casadas_v2.dta, replace

********************************************************************************
*Casadas
use $dta/casadas_v2.dta, clear
preserve
tostring folio, replace force
tempfile vcasadas
save $dta/vcasadas, replace

*Solteras
use $dta/solteras_v2.dta, clear
preserve
tostring folio, replace force
tempfile vsolteras
save $dta/vsolteras, replace

*Separadas
use $dta/separadas_v2.dta, clear
preserve
tostring folio, replace force
tempfile vseparadas
save $dta/vseparadas, replace

clear
append using $dta/vcasadas, force 
append using $dta/vsolteras, force
append using $dta/vseparadas, force

saveold $dta/violencia.dta, replace

********************************************************************************
use $dta/violencia.dta, clear

note: v1 ultimos 12 meses
note: v a lo largo de la vida

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

keep if edad>=15 & edad<50

***********
*INDICADOR*
***********

svyset upm [pw=factorm], strata(estrato)

tab v1_sexual [w=factorm]
svy: proportion v1_sexual 
estat cv

tab v_sexual [w=factorm]
svy: proportion v_sexual 
estat cv

tab pdepto v1_sexual [w=factorm], nofreq row
svy: proportion v1_sexual, over(pdepto) 
estat cv

tab pdepto v_sexual [w=factorm], nofreq row  
svy: proportion v_sexual, over(pdepto) 
estat cv

tab gedad v1_sexual [w=factorm], nofreq row
svy: proportion v1_sexual, over(gedad) 
estat cv

tab gedad v_sexual [w=factorm], nofreq row  
svy: proportion v_sexual, over(gedad) 
estat cv










