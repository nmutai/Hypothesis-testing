*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 16.1.2: Test on the tntercept            *;
*************************************************;

* Simple linear regression including test for H0: beta_1=0;
proc reg data=students;
 model weight=height;
run;


* Perform test for H0: beta_0=10;
proc reg data=students;
 model weight=height;
 test intercept=10;
run;
