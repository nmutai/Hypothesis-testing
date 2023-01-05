################################################################
# Statistical Hypothesis Testing with SAS and R                #  
# by Dirk Taeger and Sonja Kuhnt                               # 
# (c) John Wiley & Sons, Ltd                                   # 
#                                                              #
# Test 3.2.2: t-test on variances of two dependent populations #
################################################################

# Calculate sample standard deviations and sample size
std1=sd(iq$IQ1)
std2=sd(iq$IQ2)
n_total<-length(iq$IQ1)

# Calculate correlation coefficient
r<-cor(iq$IQ1,iq$IQ2)


# Calculate test statistic and two-sided p-value
df<-n_total-2;
t<-(sqrt(df)*(std1^2-std2^2))/(4*(1-r^2)*std1^2*std2^2)
p_value=2*pt(-abs(t),df)

# Output results
t
df
p_value



