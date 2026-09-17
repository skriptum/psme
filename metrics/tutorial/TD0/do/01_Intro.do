/*

# 16.09.2026 Intro to Stata

This is a do file for Stata (ugh)

Commands:
- Run whole file: ⇧⌘D (Shift+Command+D)
- Run one line: ⇧⌘E (Shift+Command+E)
*/

*------------------------------------------*
*STANDARD PREAMBLE*

clear mata 
capture log close
clear

* Change Working Directory
cd "~/Documents/psme/metrics/tutorial/TD0"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Intro", replace tex

*------------------------------------------*
* Data Importing 

*CSV import*
import delimited "$dirraw/DP_LIVE_12092022080535603.csv", clear

*Cleaning
keep if location=="FRA"
keep if subject=="CO2"
keep if measure=="MLN_TONNE"

*Plot
line value time, title("Emission of CO2") subtitle("France")

graph export "$dirfig/Emissions_FRA.png", replace

*Export Dataset as CSV
export excel "$dirdata/Emissions_FRA.xlsx", replace

*------------------------------------------*
* Excel Opening

import excel "$dirraw/econ-gen-taux-inflation.xlsx", clear

* PROBLEM: first lines of the excel file are useless
* TIP: `help import excel` to find all options
import excel "$dirraw/econ-gen-taux-inflation.xlsx", sheet("Données") cellrange(A4:B39) clear firstrow

* CLEANING

* Drop Zeros
drop if Tauxdinflation==. 

*Rename Column
rename Année year

*Convert year from string to numbers
destring year, replace

* PLOT
line Tauxdinflation year 
graph export "$dirfig/Inflation_FRA.png", replace

*------------------------------------------*


