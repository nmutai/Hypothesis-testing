**************************************************************;
* Statistical Hypothesis Testing with SAS and R              *;
* by Dirk Taeger and Sonja Kuhnt                             *;
* (c) John Wiley & Sons, Ltd                                 *;
*                                                            *;
* Test 3.1.2: Chi-square test on the variance (mean unknown) *;
**************************************************************;

* Calculate sample std and sample size;
proc means data=blood_pressure std;
 var mmhg;
 output out=chi01 std=std_sample n=n_total;
run;

* Calculate test-statistic and p-values;
data chi02; 
 set chi01;
 format p_value_A p_value_B p_value_C pvalue.;
 df=n_total-1;
 sigma0=20;    * Set std under the null hypothesis;
 chisq=(df*(std_sample**2))/(sigma0**2); 
 * p-value for hypothesis (A);
 p_value_A=2*min(probchi(chisq,df),1-probchi(chisq,df)); 
 * p-value for hypothesis (B);
 p_value_B=1-probchi(chisq,df); 
 * p-value for hypothesis (C);
 p_value_C=probchi(chisq,df); 
run;

* Output results;
proc print;
 var chisq df p_value_A p_value_B p_value_c;
run; 



