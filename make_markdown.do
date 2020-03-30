/* make_markdown

*/
	
clear
	
foreach i of numlist 4/4 { // change numbers here depending on which part to produce
	cd "~/git_repos/metricsinstata/docs/part`i'"
	markstat using "part`i'.stmd", bundle
}


	
