#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 4.1.1: Binomial test                     #
#################################################


# Number of observations
n<-length(malfunction$malfunction)
# Number of successes
d<-length(malfunction$malfunction
                [malfunction$malfunction==1])
# Proportion to test                
p0<-0.5                     

# Exact test
binom.test(d,n,p0,alternative="two.sided")
# Asymptotic test
prop.test(d,n,p0,alternative="two.sided",correct=TRUE)