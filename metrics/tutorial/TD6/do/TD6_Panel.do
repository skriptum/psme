*STANDARD PREAMBLE*

clear mata 
capture log close
clear

*MARTENs path
cd "~//Documents/psme/metrics/tutorial/TD6/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/processed/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Intro", replace tex

*-------------------------------------------
* PANEL

use "$dirraw/psid.dta", clear

list id year if _n < 20

* reshape to wide

preserve 

keep id year wage

reshape wide wage, i(id) j(year)

list if _n <= 20

restore 

* check duplicates

duplicates list id year

xtset id year

xtdescribe

xtsum wage

br south

encode south, gen(dsouth)

xttab dsouth

******* 

gen lwage = log(wage)

xtline lwage, overlay

xtline lwage if id <= 10, overlay

* quietly lwage if id <= 10, overlay legend(off saving)



