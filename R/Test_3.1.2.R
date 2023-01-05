##############################################################
# Statistical Hypothesis Testing with SAS and R              #  
# by Dirk Taeger and Sonja Kuhnt                             # 
# (c) John Wiley & Sons, Ltd                                 # 
#                                                            # 
# Test 3.1.2: Chi-square test on the variance (mean unknown) #   
##############################################################


# Calculate sample std and sample size;

std_sample<-sd(blood_pressure$mmhg)
n<-length(blood_pressure$mmhg)


# Set std under the null hypothesis
sigma0<-20

# Calculate test-statistic and p-values;
df=n-1
chisq<-(df*std_sample^2)/(sigma0^2)
# p-value for hypothesis (A)
p_value_A=2*min(pchisq(chisq,df),1-pchisq(chisq,df))
# p-value for hypothesis (B)
p_value_B=1-pchisq(chisq,df)
# p-value for hypothesis (C)
p_value_C=pchisq(chisq,df)

# Output results
chisq
df
p_value_A
p_value_B
p_value_C



