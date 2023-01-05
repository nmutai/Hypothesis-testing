*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 17.2.1: Bartlett test                    *;
*************************************************;
 
proc glm data = crop;
 class house;
 model kg = house;
 means house / hovtest=BARTLETT ;
run;
quit;
