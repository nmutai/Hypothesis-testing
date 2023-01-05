#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 15.2.1: Test on outliers for             #
#              exponential null distributions   #
#################################################

# Calculate sample size
n<-length(waiting$time)

# Sort waiting time
x<-sort(waiting$time)

# Calculate test statistic
e_A<-(x[n]-x[n-1])/(x[n]-x[1])
e_B<-(x[2]-x[1])/(x[n]-x[1])

# Calculate p-values
p_value_A<-(n-1)*(n-2)*beta((2-e_A)/(1-e_A),n-2)
p_value_B<-1-(n-2)*beta((1+(n-2)*e_B)/(1-e_B),n-2)

# Output results
"Test on an upper outlier in an exponential sample"
e_A
p_value_A

"Test on a lower outlier in exponential sample"
e_B
p_value_B

