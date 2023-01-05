#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 17.1.1: One-way ANOVA                    #
#################################################

summary(aov(crop$kg~factor(crop$house)))

