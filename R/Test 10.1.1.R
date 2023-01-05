#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 10.1.1: Kolmogorov-Smirnov two sample    #
#              test (Smirnov test)              #
#################################################

x<-blood_pressure$mmhg[blood_pressure$status==0]
y<-blood_pressure$mmhg[blood_pressure$status==1]

ks.test(x,y,alternative="two.sided",exact=FALSE)

