* ==========================
* CLEANING THE DATA
* ==========================



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
log using "$dirlog/01_cleaning", replace tex

*-------------------------------------------
* CODE STARTS HERE
