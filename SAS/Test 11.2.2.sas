*************************************************;
* Statistical Hypothesis Testing with SAS and R *; 
* by Dirk Taeger and Sonja Kuhnt                *;
* (c) John Wiley & Sons, Ltd                    *;
*                                               *;
* Test 11.2.2: Jarque-Bera test                 *;  
*************************************************;

proc autoreg data=blood_pressure;
 model mmhg= /normal;
run;

