*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 7.1.2: Spearman's rank correlation       *;
*             coefficient                       *; 
*************************************************;

* a) Test the hypothesis H0: Rho=0;
proc corr data=students spearman;
 var height weight;
run;

* b) Test the hypothesis H0: Rho=0.5;
proc corr data=students spearman fisher(rho0=0.5 biasadj=no type=twosided);
 var height weight;
run;

