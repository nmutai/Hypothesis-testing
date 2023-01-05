*****************************************************************;
* Statistical Hypothesis Testing with SAS and R                 *;
* by Dirk Taeger and Sonja Kuhnt                                *;
* (c) John Wiley & Sons, Ltd                                    *;
*                                                               *;
* Test 3.2.1: Two-sample F-test on variances of two Populations *;
*****************************************************************;

*** Variant 1 ***;
* Only for hypothesis (A);
proc ttest data=blood_pressure h0=0 sides=2;
 class status;
 var mmhg;
run;

*** Variant 2 ***;
* For hypotheses (A),(B), and (C);
* Calculate the two standard deviations and sample size;
proc means data=blood_pressure std;
 var mmhg;
 by status;
 output out=ftest01 std=stdvalue n=n_total;
run;

* Output the std in two different datasets;
data ftest02 ftest03;;
 set ftest01;
 if status=0 then output ftest02;
 if status=1 then output ftest03;
run;

* Rename std and sample size of the subjects with status=0;
data ftest02;
 set ftest02;
 rename stdvalue=std_status0
        n_total=n_status0;
run; 

* Rename std and sample size of subjects with status=1;
data ftest03;
 set ftest03;
 rename stdvalue=std_status1
        n_total=n_status1;
run; 

* Calculate test statistic p-values;
data ftest04; 
 merge ftest02 ftest03;
 format p_value_A p_value_B p_value_C pvalue.;

*Calculate numerator and denominator of the F-statistic;
 std_num=max(std_status0,std_status1); 
 std_den=min(std_status0,std_status1);

* Calculate the appropriate degrees of freedom;
 if std_num=std_status0 then
   do;
    df_num=n_status0-1;
    df_den=n_status1-1;
   end; 
  else
   do;
    df_num=n_status1-1;
    df_den=n_status0-1;
   end;

* Calculate the test-statistic;
 f=std_num**2/std_den**2;
 
* p-value for hypothesis (A);
 p_value_A=2*min(probf(f,df_num,df_den),1-probf(f,df_num,df_den));
* p-value for hypothesis (B);
 p_value_B=1-probf(f,df_num,df_den);
* p-value for hypothesis (C);
 p_value_C=probf(f,df_num,df_den);

run;

* Output results;
proc print;
 var f df_num df_den p_value_A p_value_B p_value_C;
run; 



