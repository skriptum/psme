* ==================
* MASTER FILE: run all do files in one run
* ==================

*STANDARD PREAMBLE*

clear mata 
capture log close
clear

*MARTENs path
cd "~/blablabla/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/processed/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Master", replace tex

*-------------------------------------------
