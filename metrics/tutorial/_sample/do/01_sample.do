*STANDARD PREAMBLE*

clear mata 
capture log close
clear

cd "~/Documents/psme/metrics/tutorial/_sample/"
log using data/log/01_sample.log, replace tex
