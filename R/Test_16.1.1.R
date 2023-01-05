#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 16.1.1: Test on the slope                #
#################################################

# Read the data
y<-students$weight
x<-students$height

# Simple linear regression including test for H0: beta_1=0
reg<-summary(lm(y~x))

# Perform test for H0: beta_1=0.5

# Get estimated coefficient
beta_1<-reg$coeff[2,1]

# Get standard deviation of estimated coefficient
std_beta_1<-reg$coeff["x",2]

# Perform the test
t_value<-(beta_1-0.5)/std_beta_1

# Calculate p-Value
p_value<-2*pt(-abs(t_value),18)

# Output result
# Simple linear regression
reg

# For hypothesis H0: beta_1=0.5
t_value
p_value
