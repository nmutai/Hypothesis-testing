#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 8.2.2: Wilcoxon matched-pairs            #
#             signed-rank test                  #
#################################################

wilcox.test(iq$IQ1,iqIQ2,mu=0,paired=TRUE,exact=FALSE,correct=FALSE,alternative="two.sided")

