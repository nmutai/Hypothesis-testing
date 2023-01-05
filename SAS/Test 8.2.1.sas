*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 8.2.1: Wilcoxon rank-sum test            *;
*             (Mann-Whitney U test)             *;  
*************************************************;

proc npar1way data=blood_pressure wilcoxon correct=yes;
 class status;
 var mmhg; 
 exact wilcoxon;
run;
