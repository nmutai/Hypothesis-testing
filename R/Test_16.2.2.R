#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 16.2.2: Test for significance of         #
#              regression                       #
#################################################

summary(lm(students$weight~students$height+factor(students$sex)))
