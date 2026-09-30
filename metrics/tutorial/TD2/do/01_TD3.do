*STANDARD PREAMBLE*

clear mata 
capture log close
clear

cd "~/Documents/psme/metrics/tutorial/TD2/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_TD3", replace tex

use "$dirraw/TD1_2.dta"

*--------------------------------
// Descriptive

describe braindrain1990
summarize braindrain1990

list Country braindrain1990 

tabulate region

replace braindrain1990 = . if braindrain1990 == 99

replace popgrowth = . if popgrowth == 99

// mean of pop growth by country
bysort Country: egen mean_popgrowth = mean(popgrowth)


// Dummy variable, auto created
gen popgrowthnew = (popgrowth > 1) if popgrowth != .
*br popgrowth popgrowthnew

// name and label
label variable popgrowthnew "Dummy = 1 if popgrowth > 1"

*--------------------------------
*Histogram

histogram BD02000, frequency kdensity title("Share of Immigrants in 2000 (Histo)") addlabels

graph export "$dirfig/Histogram.png", replace

* Scatter Plot
twoway (scatter lexp BD02000) (lfitci lexp BD02000), title("Life Expectancy vs Brain Drain") xtitle("Brain Drain") ytitle("Life Expectancy ")
*/

