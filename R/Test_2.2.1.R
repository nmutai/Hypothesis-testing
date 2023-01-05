#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 2.2.1: Two-sample z-test                 #
#################################################

# Set difference to be tested
d0 <- 0
# Set standard deviation of sample with status 0
sigma0 <- 10
# Set standard deviation of sample with status 1
sigma1 <- 12

# Calculate the two means
mean_status0 <- mean(blood_pressure$mmhg[blood_pressure$status == 0])
mean_status1 <- mean(blood_pressure$mmhg[blood_pressure$status == 1])

# Calculate both the sample sizes
n_status0 <- length(blood_pressure$mmhg[blood_pressure$status == 0])
n_status1 <- length(blood_pressure$mmhg[blood_pressure$status == 1])

# Calculate test statistic and two-sided p-value
z <- ((mean_status0 - mean_status1) - d0) / sqrt(sigma0^2 / n_status0 + sigma1^2 / n_status1)
p_value <- 2 * pnorm(-abs(z))

# Output results
z
p_value
