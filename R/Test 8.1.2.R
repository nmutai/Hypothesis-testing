#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 8.1.2: Wilcoxon signed-rank test         #
#################################################

wilcox.test(blood_pressure$mmhg,mu=120,exact=FALSE,correct=TRUE,alternative="two.sided")

