*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 14.3.1: Large sample test on the         *;
*              odds ratio                       *;
*************************************************;

* Sort the dataset in the right order;
proc sort data=malfunction;
 by company descending malfunction;
run;

* Use proc freq to get the counts saved into freq_table;
proc freq order=data;
 tables company*malfunction /out=freq_table;
run;

* Get the counts out of freq_table;
data n11 n12 n21 n22;
 set freq_table;
 if company='A' and malfunction=1 then do;
    keep count; output n11;
 end;
 if company='A' and malfunction=0 then do;
    keep count; output n12;
 end;
 if company='B' and malfunction=1 then do; 
    keep count; output n21;
 end;
 if company='B' and malfunction=0 then do;
    keep count; output n22;
 end;
run;

* Rename counts;
 data n11; set n11; rename count=n11; run;
 data n12; set n12; rename count=n12; run;
 data n21; set n21; rename count=n21; run;
 data n22; set n22; rename count=n22; run;

* Merge counts together and calculate test statistic;
data or_table;
 merge n11 n12 n21 n22;

 * Calculate the Odds Ratio;
 OR=(n11*n22)/(n12*n21);

 * Calculate the standard deviation of ln(OR);
 SD=sqrt(1/n11+1/n12+1/n22+1/n21);

 * Calculate test statistic;
 z=log(OR)/SD;

 * Calculate p-values;
 p_value_A=2*probnorm(-abs(z));
 p_value_B=1-probnorm(z);
 p_value_C=probnorm(z);
run;

* Output results;
proc print split='*' noobs;
 var OR z p_value_A p_value_B p_value_C;
 label OR='Odds Ratio*----------'
       z='Test Statistic*--------------'
       p_value_A='p-value A*---------'
	   p_value_B='p-value B*---------'
	   p_value_C='p-value C*---------';
 title 'Test on a Odds Ratio';
run;



