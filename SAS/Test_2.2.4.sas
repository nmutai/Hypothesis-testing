*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.2.4: Paired z-test                     *;
*************************************************;

* Calculate the difference of each observation;
data iq_diff;
 set iq;
 diff=iq1-iq2;
run;

* Calculate the mean and sample size;
proc means data=iq_diff mean;
 var diff;
 output out=ztest mean=mean_diff n=n_total;
run;

* Caculate test statistic and two-sided p-value;
data ztest; 
 set ztest;
 d0=-10;           * Set difference to test;
 sigma_diff= 1.40; * Set standard deviation;
 format p_value pvalue.;
 z= sqrt(n_total)*((mean_diff-d0)/sigma_diff); 
 p_value=2*probnorm(-abs(z));
run;

* Output results;
proc print;
 var z p_value;
run; 


