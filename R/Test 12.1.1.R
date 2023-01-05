#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 12.1.1: Kolmogorov-Smirnov test          #
#################################################

# Calculate the rate lambda
lambda<-1/mean(waiting$time)

# Calculate the test
ks.test(waiting$time,pexp,rate=lambda,alternative="less",exact=FALSE)



