/* make_markdown

*/
	
clear
	
foreach i of numlist 1/3 {
	cd "~/git_repos/metricsinstata/docs/part`i'"
	markstat using "part`i'.stmd", bundle
}


	
