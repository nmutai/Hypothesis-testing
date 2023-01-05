#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 11.1.1: Kolmogorov-Smirnov test          #
#              (Lilliefors test for normality)  #    
#################################################

# Calculate mean and standard deviation
m<-mean(blood_pressure$mmhg)
s<-sd(blood_pressure$mmhg)

ks.test(blood_pressure$mmhg,pnorm,mean=m,sd=s,alternative="two.sided",exact=FALSE)

