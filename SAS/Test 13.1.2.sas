*************************************************;
* Statistical Hypothesis Testing with SAS and R *;
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 13.1.2: Runs up and down test            *;
*************************************************;

* Convert the values in a sequence of "+" for a run up
* and a "-" for a run down.;
data runs1;
  set harvest;
   d=dif(harvest);
   if dif(harvest)<0 then vec="-";
   if dif(harvest)>0 then vec="+";
run;

* Get rid of first observation;
data runs2;
 set runs1(firstobs=2);
run;

* Calculate runs;
data runs3;
 set runs2;
 retain upruns 0 downruns 0;
 
 temp1=vec;        * Let temp1 be the same as vec;
 temp2=lag(vec);   * temp2 is a lagged variable of vec (a shift of one place);

 * Detect the starting run;
 if _N_=1 then do;
   if vec='+' then upruns=1;
   if vec='-' then downruns=1;
 end;

 * Go through the dataset for all other observations
 * and counting runs up and runs down;
 if _N_>1 then do;
  if temp1 ^= temp2 then do;
   if temp1='+' then upruns=upruns+1;
   if temp1='-' then downruns=downruns+1 ;
  end;
end;
 
run;

* Calculate test statistic and p-values;
data runs4;
 set runs3 nobs=nobs;
 drop temp1 temp2;
 format p_value_A pvalue.;

 if _n_=nobs;  * Keep last observation of the dataset 'runs3';

 v=(upruns+downruns); * Total number of runs;
 n=_N_+1;             * Number of observations;

 * Calculate test statistic;
  mu=(2*n-1)/3;
  sigma=sqrt((16*n-29)/90);
  z=(v-mu)/sigma;

  p_value_A=2*probnorm(-abs(z));
  p_value_B=1-probnorm(z);
  p_value_C=probnorm(z);  
run;

* Output results;
proc print split='*' noobs;
 var z v p_value_A p_value_B p_value_C;
 label z='Test statistic Z*----------------'
       v='No. of Runs*-----------'
       p_value_A='p-value A*----------'
	   p_value_B='p-value B*----------'
	   p_value_C='p-value C*----------';
 title 'Runs Up and Down Test';
run;
 


