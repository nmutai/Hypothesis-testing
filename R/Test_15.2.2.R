#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 15.2.2: Test on outliers for             #
#              uniform null distributions       #
#################################################

# Set parameter for testing of lower and upper outliers
h=1
k=1

# Read dataset and sort it
x<-sort(pvalues$pvalue)
n<-length(x)

# Calculate test statistic
u<-((x[n]-x[n-k]+x[h+1]-x[1])/(x[n-k]-x[h+1]))*((n-k-h-1)/(k+h)) 

# Calculate p-value
p_value<-1-pf(u,2*(k+h),2*(n-k-h-1))

# Output results
"Test on lower an upper outlier in a univariate sample"
u
p_value
