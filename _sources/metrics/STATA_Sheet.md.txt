# Stata Cheat Sheet

Keyboard Shortcuts

- Run whole file: ⇧⌘D (Shift+Command+D) 
  - also if we select multiple lines (e.g for preserve restore)
- Run one line: ⇧⌘E (Shift+Command+E)



## Preamble

Clean Memory

```stata
clear mata 
capture log close
clear
```

Files and Folders

```stata
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
```



## Reading Data

CSV

```stata
import delimited "$dirraw/DP_LIVE_12092022080535603.csv", clear
```

Excel

```stata
import excel "$dirraw/econ-gen-taux-inflation.xlsx", sheet("Données") cellrange(A4:B39) clear firstrow
```

DTA

```stata
use "$dirraw/BD.dta", clear
```



## Describing Data

```stata
codebook BD01990 // very detailed infos

summarize BD01990 // Summary statistics

describe BD01990 // Labels and types
```

**exisitng variables and obsvervations (list)** 

```stata
list 
```

**Distrinct values (tabulate**)

```stata
tabulate varlist
```



## Cleaning Data

**Filter**: 

```stata
keep if variable=="FRA"
```

**Drop**:

```stata
drop if Tauxdinflation==. 
```

**Rename** Column

```stata
rename Année year
renvars 
```

**Convert** year from string to numbers

```stata
destring year, replace
````

**Missing**

```stata
count if missing variable
```

**Subsets by**

```stata
by variable
```

- use a subset of a sumple, 



### Descriptions

**Labels**

```stata
label variable ["description"]

label define lexp_d_lab 1 "Young" 2 "Moderate" 3 "Old"
label values lexp_d lexp_d_lab
```

- For value labels: first define, then apply
- for variable description, apply directly



## Manipulation

**Ordering**

```stata
sort var
gsort var
bysort 
```

**Reshaping**

```stata
reshape long coffee maize, i(country) j(year)
```

- Long = preferential in STATA
- year, coffee maize are created by the command
  - e.g from coffee_2011, maize_2011, coffee_2012

**Checkpoints**

```stata
preserve 
...
restore
```





## Transforming Data

**New columns (generate)**

```stata
generate [type] newvar = []
```

- can be done with functions etc

**Replacing**

```stata
replace variable = . if variable == [missingval]
```

- replace a variable with `.` if variable equals a certain value, e.g. 0
- similar to generate



**new columns with transformation**

```stata
egen [type] newvar = fcn() [if]
```

- e.g average per student etc



An example to create a categorical var

```stata
summarize lexp
gen lexp_d = lexp 
recode lexp_d (50/59=1) (60/69=2) (70/79=3)

label define lexp_d_lab 1 "Young" 2 "Moderate" 3 "Old"
label val lexp_d lexp_d_lab

tabulate lexp_d
```





## Combination of datasets

**Appending**

```stata
append using filename
```

- same variables!

**Merging**

```stata
merge m:n id using filename, ...
```

- and a (unique) identifier
- merge codes (from new variable `_merge`)
  - 1 = in master
  - 2 = in second data
  - 3 = both



## Plots

Create a Line plot

```stata
line value time, title("Emission of CO2") subtitle("France")
```

Save it

```stata
graph export "$dirfig/Inflation_FRA.png", replace
```

