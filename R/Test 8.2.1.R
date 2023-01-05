#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 8.2.1: Wilcoxon rank-sum test            #
#             (Mann-Whitney U test)             #
#################################################

x<-blood_pressure$mmhg[blood_pressure$status==0]
y<-blood_pressure$mmhg[blood_pressure$status==1]

wilcox.test(x,y,exact=FALSE,correct=TRUE,alternative="two.sided")

