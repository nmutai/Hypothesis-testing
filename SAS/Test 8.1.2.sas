*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 8.1.2: Wilcoxon signed-rank test         *;  
*************************************************;

*** Variant 1 ***;
* Only for hypothesis (A);
proc univariate data=blood_pressure mu0=120 loccount;
 var mmhg;
run;


*** Variant 2;
* Hypothesis (A), (B), and (C) via Gaussian approximation;

* Calculate signs of the differences to mu0=120;
data wilcox1;
set blood_pressure;
 d=abs(mmhg-120);
 if mmhg-120>0 then sign="+";
 if mmhg-120<0 then sign="-";
 if mmhg-120=0 then delete; * delete observations equal to mu0;
run;

* Calculate ranks of the absolute differences;
proc rank data=wilcox1 out=wilcox2;
 var d;
 ranks r;
run;

* Sort by signs;
proc sort;
 by sign;
run; 


* Calculate W+;
proc summary data=wilcox2;
 var r;
 by sign;
 output out=wilcox4 sum=W;
run;

* Calculate used observation size, 
  taking zero differences into account;
proc summary data=wilcox2;
 var r;
 output out=wilcox5  n=n;
run;


* Keep only W+ and merge sample size to it;
data wilcox6;
 merge wilcox4 wilcox5;
 if _N_=1;
run;

* Now compute correction factor for
  the variance because of ties;
proc sort data=wilcox2;
 by d;
run;

proc summary data=wilcox2;
 var r;
 by d;
 output out=ties1 sum=sum_ranks;
run;

data ties2;
 set ties1;
 g=_FREQ_*(_FREQ_**3-_FREQ_);
run; 

proc summary;
 var g;
 output out=ties3 sum=g_ranks;
run;

* g_ranks is the correction factor for the variance;
data ties4;
 set ties3;
 keep g_ranks;
  g_ranks=g_ranks/48; 
run;

* Merge test statistic W+, used observations n, 
  and variance correction factor g_ranks together;
data wilcox7;
 merge wilcox6 ties4;
run;

* Calculate test statistic z which
  is Gaussian distributed;
data wilcox8;
 set wilcox7;
 format pvalue_A pvalue_B pvalue_C pvalue.;

 mean=n*(n+1)/4;
 var=n*(n+1)*(2*n+1)/24-g_ranks;

 * Test statistic;
 z=(W-mean)/sqrt(var);

 * Decide which tail must be used for one-tailed tests;
 diff=n*(n+1)/2-W;   * Calculate the difference between W+ and n*(n+1)/2;
 if diff>=0 then   
  do;                * Case n*(n+1)/2 > W+;       
   pvalue_B=probnorm(-abs(z));
   pvalue_C=1-probnorm(-abs(z));
  end;
 if diff<0 then     
  do;                * Case n*(n+1)/2 < W+;         
   pvalue_B=1-probnorm(-abs(z));
   pvalue_C=probnorm(-abs(z));
  end;
  pvalue_A=2*min(probnorm(-abs(z)),1-probnorm(-abs(z)));
run;

* Output results;
proc print label;
 var n w z pvalue_A pvalue_B pvalue_C; 
  label n="Used observations"
        w="W+"
        z="Z-statistic";
run;
	   
