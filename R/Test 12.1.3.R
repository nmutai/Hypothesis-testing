#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 12.1.3: Cramer-von Mises test            #
#################################################

# Get number of observations
n<-length(waiting$time)

# Calculate the rate lambda and standardise the waiting times
lambda<-1/mean(waiting$time)
z<-lambda*waiting$time

# Sort the sample
z<-sort(z)

# Calculate the test statistic
W_sq<-1/(12*n)+sum((pexp(z)-(2*seq(1:n)-1)/(2*n))^2)

# Calculate approximative p-values according to table 4.12 
# from Stephens (1986)
W<-(1.0 + 0.16/n) * W_sq
if (W<0.035)             p_value=1-exp(-11.334+459.098*W-5652.100*W^2)
if (W>=0.035 && W<0.074) p_value=1-exp(-5.779+132.89*W-866.58*W^2)
if (W>=0.074 && W<0.160) p_value=exp(0.586-17.87*W+7.417*W^2)
if (W>=0.160)            p_value=exp(0.447-16.592*W+4.849*W^2)

# Output results
cat("Cramer-von Mises test \n\n","W^2       ","W^2*      ","p-value",
"\n","--------- ---------- ----------",
"\n",W_sq,W,p_value,"\n")
 



