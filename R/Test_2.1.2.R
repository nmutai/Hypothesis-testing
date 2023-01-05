#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 2.1.2: t-test                            #
#################################################

t.test(blood_pressure$mmhg, mu = 140, alternative = "two.sided")
