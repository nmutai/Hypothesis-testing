*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 17.2.2: Levene test                      *;
*************************************************;
 
proc glm data = crop;
 class house;
 model kg = house;
 means house / hovtest=levene (TYPE=ABS) ;
run;
quit;

