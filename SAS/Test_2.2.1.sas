*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 2.2.1: Two-sample z-test                 *;
*************************************************;

* Calculate the two means and sample sizes;
proc means data=blood_pressure mean;
 var mmhg;
 by status;
 output out=ztest01 mean=meanvalue n=n_total;
run;

* Output the means in two different datasets;
data ztest02 ztest03;;
 set ztest01;
 if status=0 then output ztest02;
 if status=1 then output ztest03;
run;

* Rename mean and sample size of the subjects with status=0;
data ztest02;
 set ztest02;
 rename meanvalue=mean_status0
        n_total=n_status0;
run; 

* Rename mean and sample size of subjects with status=1;
data ztest03;
 set ztest03;
 rename meanvalue=mean_status1
        n_total=n_status1;
run; 

* Caculate test statistic and two-sided p-value;
data ztest04; 
 merge ztest02 ztest03;
 d0=0;      * Set difference to be tested;
 sigma0=10; * Set standard deviation of sample with status 0;
 sigma1=12; * Set standard deviation of sample with status 1;
 format p_value pvalue.;
 z= ((mean_status0-mean_status1)-d0) 
      / sqrt(sigma0**2/n_status0+sigma1**2/n_status1); 
 p_value=2*probnorm(-abs(z));
run;

* Output results;
proc print;
 var z p_value;
run; 
