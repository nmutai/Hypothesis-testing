*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 17.1.1: One-way ANOVA                    *;
*************************************************;
 proc anova data = crop;
      class house;
      model kg = house;
 run;
 quit;
   
