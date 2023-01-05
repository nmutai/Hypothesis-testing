*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 8.3.1: Kruskal-Wallis test               *;  
*************************************************;

proc npar1way data=workpieces wilcoxon;
 class machine;
 var diameter; 
 exact wilcoxon;
run;
