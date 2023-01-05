*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.1.1: z-test                            *;
*************************************************;

data blood_pressure;
 set c.blood_pressure;
run;

* Calculate sample mean and total sample size;
proc means data=blood_pressure mean std;
 var mmhg;
 output out=ztest01 mean=meanvalue n=n_total;
run;

* Calculate test-statistic and p-values;
data ztest02; 
 set ztest01;
 format p_value_A p_value_B p_value_C pvalue.;
 mu0=140;    * Set mean value under the null hypothesis;
 sigma=20;   * Set known sigma;
 z=sqrt(n_total)*(meanvalue-mu0)/sigma; 

 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z); 
run;

* Output results;
proc print;
 var z p_value_A p_value_B p_value_C ;
run; 
