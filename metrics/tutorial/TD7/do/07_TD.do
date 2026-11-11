*STANDARD PREAMBLE*

clear mata 
capture log close
clear

*MARTENs path
cd "~/Documents/psme/metrics/tutorial/TD7/"

* Global Variables for STATA 
global dirraw "./data/raw/"
global dirdata  "./data/processed/"
global dirlog "./data/log"
global dirtab "./tables/"
global dirfig "./figures/"

* Set Up Logging
log using "$dirlog/01_Intro", replace tex

*-------------------------------------------

use "$dirraw/serie_DJIND.dta", clear

* TIME SERIES

tsset, quarterly

corrgram djind, lag(20)

ac djind

* First differences

gen fd_dj = djind - L.djind // or D1.djind

label var fd_dj "First Difference of DJIND"

corrgram fd_dj, lag(20)
ac fd_dj

* Dicker Fuller Test
dfuller djind, lags(1) noconstant regress // with just one lag
dfuller djind, lags(1) trend regress

* Now one FD var
dfuller fd_dj, lags(1) trend regress

* ARIMA
arima fd_dj, ar(1) robust
arima fd_dj, ma(1) robust
arima fd_dj, ar(1) ma(1) robust

* Ljung Box test (on residuals)
arima djind, ar(1) robust
predict res_ar1, residual
corrgram res_ar1, lag(20)
wntestq res_ar1



arima djind, ma(1) robust
predict res_ar2, residual
corrgram res_ar2, lag(20)
wntestq res_ar2
