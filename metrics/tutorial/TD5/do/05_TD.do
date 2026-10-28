*STANDARD PREAMBLE*

clear mata 
capture log close
clear

cd "~/Documents/psme/metrics/tutorial/TD5/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/proc/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/05_TD", replace tex

*-----------------------------------------
use "$dirraw/housing.dta"
save "$dirdata/TD04.dta", replace // Editing Copy

*Housing and Price data/log
* Idea: Hedonic Regression to infer price of a certain feature
* e.g how much are you willing to pay for an addtional bedroom


gen logprice = log(price)
gen logsize = log(lotsize)

reg logprice logsize bedrooms bathrms airco

predict uhat, residuals
kdensity uhat, normal // graph, also show the normal 


* TESTS
sktest uhat
swilk uhat

* Comparison with more vars
reg logprice logsize bedrooms bathrms airco
estimates store orignial

reg logprice logsize bedrooms bathrms airco stories prefarea
estimates store expanded

estimates stats orignial expanded

test stories prefarea

* RESET test
reg logprice logsize bedrooms bathrms airco
predict yhat

gen ysquared = yhat^2
gen ycube = yhat^3

reg logprice logsize bedrooms bathrms airco ysquared ycube

* test both for their significance
test ysquared
test ycube
test ycube ysquared

*----------------------------------
* STRUCTURAL BREAKS
* test for interactions in the data

global X "logsize bedrooms bathrms airco"
global Z ""

// Create an interaction for all variables and preferred area
foreach var in  $X {
	generate `var'pref = prefarea * `var'
	global Z "$Z `var'pref "	
}

// Now include all vars and interactions in the reg
reg logprice $X $Z prefarea, robust

test $Z prefarea
