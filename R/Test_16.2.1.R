#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 16.2.1: Test on an individual regression #
#              coefficient                      #
#################################################

# Read the data
weight<-students$weight
height<-students$height
sex<-students$sex

# Multiple linear regression
summary(lm(weight~height+factor(sex)))
