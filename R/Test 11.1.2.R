#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 11.1.2: Anderson-Darling test            #
#################################################

# Get number of observations
n<-length(blood_pressure$mmhg)

# Standardize the blood pressure
m<-mean(blood_pressure$mmhg)
s<-sd(blood_pressure$mmhg)
z<-(blood_pressure$mmhg-m)/s

# z1 is the array of the ascending sorted values
z1<-sort(z)

# z2 is the array of the descending sorted values
z2<-sort(z,decreasing=TRUE)

# Calculate the test statistic
AD<-(1/n)*sum((1-2*seq(1:n))*(log(pnorm(z1))+log(1-pnorm(z2))))-n

# Calculate modified test statistic
AD_mod<-(1.0+0.75/n+2.25/n^2)*AD

# Calculate approximative p-values according Table 4.9 from Stephens (1986)
if (AD_mod<=0.200)                  p_value=1-exp(-13.436+101.140*AD_mod-223.73*AD_mod^2)
if (AD_mod>0.200 && AD_mod<=0.340 ) p_value=1-exp(-8.318+42.796*Ad_mod-59.938*AD_mod^2)
if (AD_mod>0.340 && AD_mod<=0.600 ) p_value=exp(0.9177-4.279*AD_mod-1.38*AD_mod^2)
if (AD_mod>0.600)                   p_value=exp(0.12937-5.709*AD_mod+0.0186*AD_mod^2)

#Output results
cat("Anderson-Darling test \n\n","AD^2    ","AD^2*    ","p-value",
"\n","--------------------------",
"\n",format(AD,digits=6),format(AD_mod,digits=6),format(p_value,digits=4),"\n")
 

