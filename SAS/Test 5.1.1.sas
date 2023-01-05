*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 5.1.1: z-test on the Poisson parameter   *; 
*************************************************;

* Calculate the number of total infections;
data infections1;
 set c.infections;
 n_infections=infections*total;
run; 

proc means data=infections1 sum;
 var n_infections total;
 output out=infections2 sum=x n_hospital;
run;

* Calculate test statistic and p-value;
data infections3;
 set infections2;
 format p_value pvalue.;

 lambda0=4; * Set lambda under the null hypothesis

 * Test statistic an p-values;
 z=(x-n_hospital*lambda0)/sqrt(n_hospital*lambda0);
 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z);

* Output results; 
proc print;
 var z p_value_A p_value_B p_value_C;
run;
