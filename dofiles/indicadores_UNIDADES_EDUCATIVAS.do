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
***      Objetive: Indicadores
********************************************************************************
*MAC
clear all 
global do "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dofiles"
global dta "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/dtafiles"
global gph "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/gphfiles"
global log "/Users/laurauzquiano/Dropbox/UNICEF2018/Linea_base/files/logfiles"
use $dta/UnidadesEducativas_armon.dta, clear

*HP
clear all 
global do  "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dofiles"
global dta "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\dtafiles"
global gph "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\gphfiles"
global log "C:\Users\hp\Dropbox\UNICEF2018\Linea_base\files\logfiles"
use $dta\UnidadesEducativas_armon.dta, clear

***
cap drop IR26
gen IR26=(Pcesc_prim==1|Pcesc_sec==1)
label var IR26 "CESC con participacion de niñas y niños"

tab muni IR26, nofreq row 
tab muni Pcesc_prim, nofreq row 
tab muni Pcesc_sec, nofreq row 
 
***
cap drop qw
bysort muni: egen qw=mean(qwomen_ge)

cap drop qt
bysort muni: egen qt=mean(qtot_ge)

cap drop IR27
gen IR27=(qw/qt)*100
label var IR27 "Paridad de genero en GE"

tab IR27 if muni==1
tab IR27 if muni==2
tab IR27 if muni==3
tab IR27 if muni==4
tab IR27 if muni==5
tab IR27 if muni==6
tab IR27 if muni==7
tab IR27 if muni==8

***
cap drop IR30
gen IR30=act_ge if qtot_ge!=.
label var IR30 "Despatriarcalizacion"
tab muni IR30, nofreq row
 
***
cap drop IR25
gen IR25=(vdoc==1|vfam==1|vestud==1)
label var IR25 "Actividades contra violencia"

tab muni IR25, nofreq row
tab muni iniciativ_prop if IR25==1, nofreq row
tab muni iniciativ_ext  if IR25==1, nofreq row

tab vdoc 
tab vfam
tab vestud

***
bysort muni: egen qt_doc=mean(qtot_doc)
bysort muni: egen qp_doc=mean(qprim_doc)
bysort muni: egen qs_doc=mean(qsec_doc)
bysort muni: egen qprof_doc=mean(docPROFOCOM)

cap drop IR23
gen IR23=(qprof_doc/qt_doc)*100
label var IR23 "Porcentaje de docentes PROFOCOM"

cap drop IR23prim
gen IR23prim=(qp_doc/qt_doc)*100
label var IR23prim "Porcentaje de docentes PROFOCOM primaria"

cap drop IR23sec
gen IR23sec=(qs_doc/qt_doc)*100
label var IR23sec "Porcentaje de docentes PROFOCOM primaria"

tab IR23     if muni==8
tab IR23prim if muni==8
tab IR23sec  if muni==8

 



