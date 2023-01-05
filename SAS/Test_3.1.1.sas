************************************************************;
* Statistical Hypothesis Testing with SAS and R            *;
* by Dirk Taeger and Sonja Kuhnt                           *;
* (c) John Wiley & Sons, Ltd                               *;
*                                                          *;
* Test 3.1.1: Chi-square test on the variance (mean known) *;
************************************************************;

*Calculate squared sum; 
data chi01;
 set blood_pressure;
 mean0=130;     * Set the known mean;
 square_diff=(mmhg-mean0)**2;
run;

proc summary;
 var square_diff;
 output out=chi02 sum=sum_square_diff;
run;

* Calculate test-statistic and p-values;
data chi03; 
 set chi02;
 format p_value_A p_value_B p_value_C pvalue.;
 df=_FREQ_;
 sigma0=20;    * Set std under the null hypothesis;
 chisq=sum_square_diff/(sigma0**2); 
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



