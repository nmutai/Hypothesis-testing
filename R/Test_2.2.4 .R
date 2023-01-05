#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 2.2.4: Paired z-test                     # 
#################################################

# Set difference to test
d0<--10
# Set standard deviation of the difference
sigma_diff<-1.40

# Calculate the mean of the difference
mean_diff<-mean(iq$IQ1-iq$IQ2)

# Calculate the sample size 
n_total<-length(iq$IQ1)

# Calculate test statistic and two-sided p-value
z<-sqrt(n_total)*((mean_diff-d0)/sigma_diff)
p_value=2*pnorm(-abs(z))

# Output results
z
p_value



