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
***      Objetive: INDICADORES DE EDUCACION 
********************************************************************************
*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Desktop\BASE_DE_DATOS\_ECH"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\echBOLIVIA.dta, clear

*********************
*IP12 NIVEL NACIONAL*
********************* 
capture drop yedu_mat
gen yedu_mat= curmat  	
replace yedu_mat = 0 if yedu_mat<0 

*Numerador
capture drop aux
gen aux = (yedu_mat<3) if yedu_mat !=.
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==4 | edad==5) 
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ger_init
gen ger_init = _up/_down


********************************************************	
*P21: Tasa de término de la educación secundaria (NETA)*
******************************************************** 
capture drop _month
replace born_month = .  if born_month >12
gen _month = born_month * 30 

***NIVEL NACIONAL	
*Numerador
capture drop aux
gen aux = (edad==17 & (yedc == 12 | yedc ==13)) if yedc != .
replace aux=1 if edad==18 & yedc==12  
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==17) 
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux) 

*INDICADOR 
capture drop ntr_tsec
gen ntr_tsec = _up/_down
tab ntr_tsec if year==2012
 
***POR ÁREA: URBANO	
*Numerador
capture drop aux
gen aux = (edad==17 & (yedc == 12 | yedc ==13)) if yedc != . & rural==0
replace aux=1 if edad==18 & yedc==12 & rural==0
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==17) if rural==0
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux) 

*INDICADOR 
capture drop ntr_tsec_urb
gen ntr_tsec_urb = _up/_down

***POR ÁREA: RURAL	
*Numerador
capture drop aux
gen aux = (edad==17 & (yedc == 12 | yedc ==13)) if yedc != . & rural==1
replace aux=1 if edad==18 & yedc==12 & rural==1
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==17) if rural==1
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux) 

*INDICADOR 
capture drop ntr_tsec_rur
gen ntr_tsec_rur = _up/_down

***POR SEXO: HOMBRE
*Numerador
capture drop aux
gen aux = (edad==17 & (yedc == 12 | yedc ==13)) if yedc != . & female==0
replace aux=1 if edad==18 & yedc==12  & female==0
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==17) if female==0
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux) 

*INDICADOR 
capture drop ntr_tsec_men
gen ntr_tsec_men = _up/_down

***POR SEXO: MUJER
*Numerador
capture drop aux
gen aux = (edad==17 & (yedc == 12 | yedc ==13)) if yedc != . & female==1
replace aux=1 if edad==18 & yedc==12  & female==1
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==17) if female==1
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux) 

*INDICADOR 
capture drop ntr_tsec_fem
gen ntr_tsec_fem = _up/_down


******************************************************		
*P22: Tasa de término de la educación primaria (NETA)*
******************************************************
***NIVEL NACIONAL		
*Numerador
capture drop aux
gen aux = (edad==12 & (yedc==6 | yedc==7)) if yedc !=.  
replace aux=1 if edad==13 & yedc==6 & born_month>6
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==12) 
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ntr_tprim
gen ntr_tprim = _up/_down

tab ntr_tprim if year==2012

***POR ÁREA: URBANO	
*Numerador
capture drop aux
gen aux = (edad==12 & (yedc==6 | yedc==7)) if yedc !=.  & rural==0
replace aux=1 if edad==13 & yedc==6 & born_month>6 & rural==0
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==11) if rural==0
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ntr_tprim_urb
gen ntr_tprim_urb = _up/_down

***POR ÁREA: RURAL	
*Numerador
capture drop aux
gen aux = (edad==12 & (yedc==6 | yedc==7)) if yedc !=.  & rural==1
replace aux=1 if edad==13 & yedc==6 & born_month>6 & rural==1
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==11) if rural==1
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ntr_tprim_rur
gen ntr_tprim_rur = _up/_down

***POR SEXO: HOMBRE
*Numerador
capture drop aux
gen aux = (edad==12 & (yedc==6 | yedc==7)) if yedc !=. & female==0
replace aux=1 if edad==13 & yedc==6 & born_month>6 & female==0
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==11) if female==0
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ntr_tprim_men
gen ntr_tprim_men = _up/_down

***POR SEXO: MUJER
*Numerador
capture drop aux
gen aux = (edad==12 & (yedc==6 | yedc==7)) if yedc !=.  & female==1
replace aux=1 if edad==13 & yedc==6 & born_month>6 & female==1
replace aux = aux * factor_ine

capture drop _up 
bysort year: egen _up = total(aux)

*Denominador
capture drop aux
gen aux = (edad==11) if female==1
replace aux = aux * factor_ine

capture drop _down 
bysort year: egen _down = total(aux)

*INDICADOR
capture drop ntr_tprim_fem
gen ntr_tprim_fem = _up/_down


********************************************************************************
keep year ntr_* ger_*  				
capture drop aux
bysort year: gen aux = _n 
drop if aux > 1

capture drop aux
label var ger_init "tasa bruta de matricula: INICIAL"
label var ntr_tsec "tasa neta de termino: SECUNDARIA"
label var ntr_tprim "tasa neta de termino: PRIMARIA"
********************************************************************************

br
saveold $do\IP21IP22.dta, replace
