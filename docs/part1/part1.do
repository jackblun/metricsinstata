capture log close
log using "part1", smcl replace
//_1
/* Lecture 1
PUBLPOL 330D Winter 2020
Jack Blundell 
*/
//_2
/*
Worked example of analysis of lalonde 1986 data.
Structure:
0. Setup
1. Import raw data
2. Clean data
3. Explore data
4. Test for differences in means by group 
*/    
//_3
clear
//_4
set more off
//_5
cd "~/Dropbox/Documents/Teaching/PUBLPOL330D/Lectures/Lecture 1/markdown"
//_6
// capture log close
//_7
//log using "lecture1log", replace
//_8
import delimited "lalonde_experiment.txt", delimiter(" ", collapse)
//_9
drop v1
//_10
rename v2 t
rename v3 y
//_11
label variable t "Treatment"
label variable y "Earnings ($1,000's)"
//_12
describe
//_13
destring t, replace force
//_14
des
//_15
generate missing_y = 0
replace missing_y = 1 if y == .
//_16
tabulate missing_y
//_17
drop if missing_y == 1
//_18
save "lalonde_clean.dta", replace
//_19
use "lalonde_clean.dta", clear
//_20
summarize y
//_21
sum y, detail
//_22
tab t
//_23
histogram y, width(1)
graph export "histogram_y.png", width(500) replace
//_24
sum y if t == 0
sum y if t == 1
//_25
graph box y, by(t)
graph export "boxplot_y_by_t.png", width(500) replace
//_26
ttest y, by(t)
//_27
estpost ttest y, by(t)
esttab using "ttest_y_by_t.rtf", replace
//_28
//log close
//_^
log close
