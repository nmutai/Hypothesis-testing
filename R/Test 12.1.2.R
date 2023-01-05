#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 12.1.2: Anderson-Darling test            #
#################################################


# Get number of observations
n<-length(waiting$time)

# Calculate the rate lambda and standardize the waiting times
lambda<-1/mean(waiting$time)
z<-lambda*waiting$time

# z1 is the array of the ascending sorted values
z1<-sort(z)

# z2 is the array of the descending sorted values
z2<-sort(z,decreasing=TRUE)

# Calculate the test statistic
AD<-(1/n)*sum((1-2*seq(1:n))*(log(pexp(z1))+log(1-pexp(z2))))-n

# Calculate modified test statistic
AD_mod<-(1.0+0.6/n)*AD

# Calculate approximative p-values according Table 4.12 from Stephens (1986)
if (AD_mod<=0.260)                  p_value=1-exp(-12.2204+67.459*AD_mod-110.30*AD_mod^2)
if (AD_mod>0.260 && AD_mod<=0.510 ) p_value=1-exp(-6.1327+20.218*Ad_mod-18.663*AD_mod^2)
if (AD_mod>0.510 && AD_mod<=0.950 ) p_value=exp(0.9209-3.353*AD_mod-0.300*AD_mod^2)
if (AD_mod>0.950)                   p_value=exp(0.7310-3.009*AD_mod+0.150*AD_mod^2)

# Output results
cat("Anderson-Darling test \n\n","AD^2    ","AD^2*    ","p-value",
"\n","--------------------------",
"\n",format(AD,digits=6),format(AD_mod,digits=6),format(p_value,digits=4),"\n")
 

