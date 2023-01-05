#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 17.1.2: Two-way ANOVA                    #
#################################################

kg<-crop$kg
field<-crop$house
fertiliser<-crop$fertiliser

summary(aov(kg~factor(field)+factor(fertiliser)))


