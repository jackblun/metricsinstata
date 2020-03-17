/* make_markdown

*/
	
clear
	
foreach i of numlist 5/5 {
	cd "~/git_repos/metricsinstata/docs/part`i'"
	markstat using "part`i'.stmd", bundle
}


	
