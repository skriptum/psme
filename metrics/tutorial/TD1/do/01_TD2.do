*STANDARD PREAMBLE*

clear mata 
capture log close
clear

* Change Working Directory
cd "~/Documents/psme/metrics/tutorial/TD1"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/02_TD2", replace tex

*--------------------------------------------
*DATA IMPORT

use "$dirraw/BD.dta", clear

save "$dirdata/B1.dta", replace // Create new modified dataset

*--------------------------------------------
* Descriptive 

codebook BD01990 // very detailed infos

summarize BD01990, detail // Summary statistics
summarize BD01990 if Country=="Angola"

describe BD01990 // Labels and types

list BD01990 // List all vars

tabulate BD01990, missing // all distinct values, including missing!

*--------------------------------------------
* Manipulation

keep Country BD01990 BD02000

sort BD01990

// Checkpoints
preserve

use "$dirraw/lifeexp", clear

summarize

restore

// Another Example

preserve
// Reshape 
keep BD0* Country

reshape long BD0, i(Country) j(year)
list in f/10
tabulate year

restore

merge 1:1 Country using "$dirraw/lifeexp"

save "$dirdata/TD1.dta", replace

// Generate Variables
generate missvar = . 
count if region == .
replace missvar = 1 if region == .

generate missvar2 = 1 if region == .

// Show missing by region
bysort region: egen newvar2 = total(missvar)
tabulate region newvar2

// Create a categorical variable for Life expectancy
summarize lexp
gen lexp_d = lexp 
recode lexp_d (50/59=1) (60/69=2) (70/79=3)

label define lexp_d_lab 1 "Young" 2 "Moderate" 3 "Old"
label val lexp_d lexp_d_lab

tabulate lexp_d

// Missing Variables
list Country BD0* region in f/10
tab region

rename BD01990 braindrain1990

label var braindrain1990 "Brain Drain in the 1990s"

count if missing(braindrain1990) // = 30

save "$dirdata/TD1_2.dta", replace
