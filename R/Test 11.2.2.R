#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 11.2.2: Jarque-Bera test                 #
#################################################

# Calculate sample size
n<-length(blood_pressure$mmhg)

# Calculate sample skewness and sample kurtosis
x<-blood_pressure$mmhg
skewness<-(sum((x-mean(x))^3)/n)/(sum((x-mean(x))^2)/n)^(3/2)
kurtosis<-(sum((x-mean(x))^4)/n)/((sum((x-mean(x))^2)/n)^2)

# Calculate test statistic
jb<-n*(skewness^2/6+(kurtosis-3)^2/24)

#Calculate asymptotic p-value
p_value<-1-pchisq(jb,2)

# Output results
cat("Jarque-Bera Test \n\n",
"JB          ","p-value",
"\n","---------------------",
"\n",jb,"  ",p_value,"\n")
 