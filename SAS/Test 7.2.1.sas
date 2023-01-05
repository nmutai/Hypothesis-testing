*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 7.2.1: z-test for two correlation        *;
*             coefficients (independent         *;
*             populations)                      *;  
*************************************************;

* Sort data by sex; 
proc sort data=students;
 by sex;
run;

* Calculate correlation coefficients of male and female;
proc corr data=students outp=corr_data;
 by sex;
 var height weight;
run;

* Make four datasets from the output: number of observations
* and correlation coefficients for male and female; 
data n_male corr_male n_female corr_female;
 set corr_data;
 if _type_="N" and sex=1 then output n_male;
 if _type_="N" and sex=2 then output n_female;
 if _type_="CORR" and _name_="height" and sex=1 then output corr_male;
 if _type_="CORR" and _name_="height" and sex=2 then output corr_female;
run;

* Rename number of observations of males as n1;
data n_male;
 set n_male;
 rename height=n1;
 keep height;
run;

* Rename number of observations of females as n2;
data n_female;
 set n_female;
 rename height=n2;
 keep height;
run;

* Rename correlation coefficients of males as rho1;
data corr_male;
 set corr_male;
 rename weight=rho1;
 keep weight;
run; 

* Rename correlation coefficients of females as rho2;
data corr_female;
 set corr_female;
 rename weight=rho2;
 keep weight;
run; 

* Merge all data into a dataset with a single observation;
data corr;
 merge corr_male corr_female n_male n_female;
run;

* Calculate test statistic and p-values;
data corr_test;
 set corr;
  Z=0.5*(log((1+rho1)/(1-rho1))-log((1+rho2)/(1-rho2)))/(sqrt(1/(n1-3)+1/(n2-3)));

  diff=rho1-rho2;

* p-values for hypothesis (A), (B), and (C);
 pvalue_A=2*min(probnorm(-abs(Z)),1-probnorm(-abs(Z)));

 if diff>=0 then
  do;  
   pvalue_B=probnorm(-abs(Z));
   pvalue_C=1-probnorm(-abs(Z));
  end;

 if diff<0 then
  do;
   pvalue_B=1-probnorm(-abs(Z));
   pvalue_C=probnorm(-abs(Z));
  end; 

run;

* Output results;
proc print;
 var rho1 rho2 pvalue_A  pvalue_B pvalue_C;
run;
