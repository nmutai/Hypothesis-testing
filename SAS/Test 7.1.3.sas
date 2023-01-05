*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 7.1.3: Partial correlation               *;  
*************************************************;

proc corr data=students pearson;
 var height weight;
 partial sex;
run;
