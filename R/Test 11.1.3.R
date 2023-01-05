#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 11.1.3: Cramer-von Mises test            #
#################################################

# Get number of observations
n<-length(blood_pressure$mmhg)

# Standardise the blood pressure
m<-mean(blood_pressure$mmhg)
s<-sd(blood_pressure$mmhg)
z<-(blood_pressure$mmhg-m)/s

# Sort the sample
z<-sort(z)

# Calculate the test statistic
W_sq<-1/(12*n)+sum((pnorm(z)-(2*seq(1:n)-1)/(2*n))^2)

# Calculate approximative p-values according to table 4.9 
# from Stephens (1986)
W<-(1 + 0.5/n) * W_sq
if (W<0.0275) p_value=1-exp(-13.953+775.500*W-12542.610*W^2)
if (W>=0.0275 && W<0.0510) p_value=1-exp(-5.9030+179.546*W-1515.290*W^2)
if (W>=0.0510 && W<0.092)  p_value=exp(0.886-31.620*W+10.897*W^2)
if (W>=0.092) p_value=exp(1.111-34.242*W+12.832*W^2)

# Output results
cat("Cramer-von Mises test \n\n","W^2       ","W^2*      ","p-value",
"\n","--------- ---------- ----------",
"\n",W_sq,W,p_value,"\n")
 



