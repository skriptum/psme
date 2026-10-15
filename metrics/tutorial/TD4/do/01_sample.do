*STANDARD PREAMBLE*

clear mata 
capture log close
clear

cd "~/Documents/psme/metrics/tutorial/TD4/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Intro", replace tex

*------------

use "$dirraw/labor.dta", clear

* LOOPS


global X "labor capital wage output"

sum `X'

foreach var in $X {
	gen log`var' = log(`var')
}

kdensity labor
kdensity loglabor // definitely preferable here!

*-------------------------------------------
** Lets detect some Heteros.

reg loglabor logcapital logwage logoutput

* get the errors, resiudals and fitted values
predict uhat, residuals
predict yhat

* Is there a connection between both?
twoway scatter uhat yhat

generate uhat2 = uhat*uhat
twoway scatter uhat2 yhat

* Regress both
reg uhat2 yhat // = Brasch Pagan test 

estat hettest, rhs fstat

* Other test: white 
ssc install whitetst // Install first
help whitetst // Quick Look
whitetst // Results

*-------------------------------------
** Robust Standard Error

reg loglabor logcapital logoutput logwage
estimates store original

reg loglabor logcapital logoutput logwage, robust
estimates store robust

estimates table original robust, se

ssc install estout
esttab original robust, se // prettier one

esttab original robust using "$dirtab/Table1.tex", se label replace wide plain
