#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 16.1.2: Test on the intercept            #
#################################################

# Read the data
y<-students$weight
x<-students$height

# Simple linear regression
reg<-summary(lm(y~x))

# Perform test for H0: beta_0=10

# Get estimated coefficient
beta_0<-reg$coeff[1,1]

# Get standard deviation of estimated coefficient
std_beta_0<-reg$coeff[1,2]

# Perform the test
t_value<-(beta_0-10)/std_beta_0

# Calculate p-Value
p_value<-2*pt(-abs(t_value),18)

# Output result
# Simple linear regression
reg

# For hypothesis H0: beta_0=10
t_value
p_value
