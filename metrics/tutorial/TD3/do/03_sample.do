*STANDARD PREAMBLE*

clear mata 
capture log close
clear

cd "~/Documents/psme/metrics/tutorial/TD3/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Intro", replace tex

*-----------------------------
* TD 3

use "$dirraw/wages.dta"

save "$dirdata/TD02.data", replace

* Examine Data

describe

summarize

* wages by urban

bysort urban: summarize wage

gen rural = (urban == 0)

* Regressions

reg wage urban

reg wage rural 

* Multiple Regressions

reg wage rural urban

reg wage rural exper 
estat ic // additional tests

* Test for non-linearity (higher wage = decreasing rate of wage)

gen exper2 = exper*exper

reg wage urban exper exper2 

test exper exper2

* Interaction terms

reg wage rural educ exper c.educ#c.rural c.exper#c.rural
