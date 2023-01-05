#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 12.2.1: Chi-square Goodness-of-fit test  #
#################################################

obs<-c(10,12,7,11,9,11)
probs<-c(1/6,1/6,1/6,1/6,1/6,1/6)

chisq.test(obs,p=probs)
