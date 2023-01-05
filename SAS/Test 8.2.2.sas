*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 8.2.2: Wilcoxon rmatched-pairs           *;
*             signed-rank test                  *;     
*************************************************;

data temp;
 set iq;
 diff=iq1-iq2;
run;

proc univariate data=temp mu0=0 loccount;
 var diff;
run;
