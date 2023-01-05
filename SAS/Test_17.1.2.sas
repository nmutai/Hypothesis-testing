*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 17.1.2: Two-way ANOVA                    *;
*************************************************;
 proc anova data= crop;
      class house fertiliser;
      model kg =  house fertiliser;
 run;
 quit;
 
 
