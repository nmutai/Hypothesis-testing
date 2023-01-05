*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 16.1.1: Test on the slope                *;
*************************************************;

* Simple linear regression including test for H0: beta_1=0;
proc reg data=students;
 model weight=height;
run;

* Perform test for H0: beta_1=0.5;
proc reg data=students;
 model weight=height;
 test height=0.5;
run;
quit;
