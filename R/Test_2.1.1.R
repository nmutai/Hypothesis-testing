#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 2.1.1: z-test                            #
#################################################

# Calculate sample mean and total sample size
xbar <- mean(blood_pressure$mmhg)
n <- length(blood_pressure$mmhg)

# Set mean value under the nullhypothesis
mu0 <- 140

# Set known sigma
sigma <- 20

# Calculate test statistic and p-values
z <- sqrt(n) * (xbar - mu0) / sigma

p_value_A <- 2 * pnorm(-abs(z))
p_value_B <- 1 - pnorm(z)
p_value_C <- pnorm(z)

# Output results
z
p_value_A
p_value_B
p_value_C
