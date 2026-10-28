* ==================
* SAMPLE FILE with the standard preamble and file paths etc
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
log using "$dirlog/01_sample", replace tex

*-------------------------------------------
* Start coding here!
