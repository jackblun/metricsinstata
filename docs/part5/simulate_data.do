/* simulate_data

Here I simulate data for use in the regression tutorial
*/
	
cd "~/git_repos/metricsinstata/docs/part5"

clear
set seed 123
set obs 10000
gen deg_run = runiform(0,1)
gen par_wealth = rnormal(50,4)
gen male_run = runiform(0,1)
gen male = male_run > 0.5
gen degree = deg_run > 0.5 & par_wealth > 50
gen earnings = rnormal(100,8) + 0.8*par_wealth + 5*degree + 1.2*male

ttest earnings, by(degree)
reg earnings degree
reg earnings degree male par_wealth

label var earnings "Earnings ($1,000)"
label var male "Male"
label var degree "Degree indicator"
label var par_wealth "Parent wealth ($1,000)"

drop *run
save "regdat.dta", replace
