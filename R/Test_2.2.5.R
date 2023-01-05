#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    # 
#                                               #
# Test 2.2.5: Paired t-test                     # 
#################################################

t.test(iq$IQ1,iq$IQ2,mu=-10,alternative="two.sided",paired=TRUE)
