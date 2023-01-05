############################################################
# Statistical Hypothesis Testing with SAS and R            #  
# by Dirk Taeger and Sonja Kuhnt                           # 
# (c) John Wiley & Sons, Ltd                               # 
#                                                          # 
# Test 3.1.1: Chi-square test on the Variance (mean known) # 
############################################################

mean0<-130 # Set known mean
sigma0<-20 # Set std under the null hypothesis

#Calculate squared sum;
sum_squared_diff<-sum((blood_pressure$mmhg-mean0)^2)

df<-length(blood_pressure$mmhg)

# Calculate test-statistic and p-values;

chisq<-sum_squared_diff/(sigma0^2)
#p-value for hypothesis (A)
p_value_A=2*min(pchisq(chisq,df),1-pchisq(chisq,df))
#p-value for hypothesis (B)
p_value_B=1-pchisq(chisq,df)
#p-value for hypothesis (C)
p_value_C=pchisq(chisq,df)


# Output results
chisq
df
p_value_A
p_value_B
p_value_C



