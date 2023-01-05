***************************************************;
* Statistical Hypothesis Testing with SAS and R   *;
* by Dirk Taeger and Sonja Kuhnt                  *;
* (c) John Wiley & Sons, Ltd                      *;
*                                                 *;
* Test 5.1.2: Exact test on the Poisson parameter *; 
***************************************************;

* Calculate the number of total infections;
data infections1;
 set c.infections;
 n_infections=infections*total;
run; 

proc means data=infections1 sum;
 var n_infections total;
 output out=infections2 sum=x n_hospital;
run;

* Calculate p-values;
data infections3;
 set infections2;
 format p_value_A p_value_B p_value_C pvalue.;

 lambda0=4; * Set lambda under the null hypothesis

 * Test on hypothesis A;
 if x<n_hospital*lambda0  then p_value_A=min(2*CDF('Poisson',x,n_hospital*lambda0),1);
 if x>=n_hospital*lambda0 then p_value_A=min(2*(1-CDF('Poisson',x-1,n_hospital*lambda0)),1);
 
 * Test on hypothesis B;
 p_value_B=1-CDF('Poisson',x-1,n_hospital*lambda0);
 
 * Test on hypothesis C;
 p_value_C=CDF('Poisson',x,n_hospital*lambda0);
run;

* Output results; 
proc print;
 var p_value_A p_value_B p_value_C;
run;
