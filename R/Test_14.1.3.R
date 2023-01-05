#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 14.1.3: Likelihood-ratio chi-square test #
#################################################

# Read the two variables company and malfunction
x<-malfunction$company
y<-malfunction$malfunction

# Getting the observed and expected cases
e<-chisq.test(x,y)$expected
o<-chisq.test(x,y)$observed

# Calculating test statistic
g2<-2*sum(o*log(o/e))

# Get degrees of freedom from function chisq.test()
df<-chisq.test(x,y)$parameter

# Calculating p-value
p_value=1-pchisq(g2,1)

# Output results
cat("Likelihood-Ratio Chi-Square Test   \n\n",
"test statistic   ","p-value","\n",
"--------------   ----------","\n",
"  ",g2,"     ",p_value," ","\n")




