*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 15.1.3: Dixon's tests                    *;
*************************************************;

* Calculate the necessary values;
proc summary data=students;
 var height;
 output out=dixon n=n idgroup(max(height) out[3](height)=max)
                      idgroup(min(height) out[3](height)=min);
run;

* Output dataset includes following variables;
* max_1 = x_(n), max_2=x_(n-1), max_3=x_(n-2);
* min_1 = x_(1), min_2=x_(2), min_3=x_(3);

data dixon_test;
 set dixon;
 
 * Calculate the test statistics r10 and r22;
 r10=(min_2-min_1)/(max_1-min_1);
 r22=(min_3-min_1)/(max_3-min_1);
 
 * Calculate p-values;
 if (r10<=0.300)                then p_value_r10=">=0.0500";
 if (r10> 0.300 and r10<=0.391) then p_value_r10=" <0.0500";
 if (r10>=0.391)                then p_value_r10=" <0.0100";

 if (r22<=0.535)                then p_value_r22=">=0.0500";
 if (r22> 0.535 and r22<=0.450) then p_value_r22=" <0.0500";
 if (r22>=0.450)                then p_value_r22=" <0.0100";
run;

* Output results;
proc print split='*' noobs;
 var r10  p_value_r10 r22 p_value_r22;
 label r10='Test on lower outlier*avoiding x(1)*----------------------------------'
       p_value_r10='p-value r10*-----------'
	   r22='Test on lower outliers*avoiding x(2), x(n), X(n-1)*----------------------------------'
       p_value_r22='p-value r22*-----------';
 title 'Dixon''s Tests';
run;
