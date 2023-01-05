##################################################
# Statistical Hypothesis Testing with SAS and R  #  
# by Dirk Taeger and Sonja Kuhnt                 # 
# (c) John Wiley & Sons, Ltd                     # 
#                                                # 
# Test 4.2.2: z-test for the equality between    #
#             two proportions (pooled variances) #
##################################################

# Number of observations for company A
n1<-length(malfunction$malfunction[malfunction$company=='A'])
# Number of successes for company A
s1<-length(malfunction$malfunction[malfunction$company=='A' & malfunction$malfunction==1])

# Number of observations for company B
n2<-length(malfunction$malfunction[malfunction$company=='B'])
# Number of successes for company B
s2<-length(malfunction$malfunction[malfunction$company=='B' & malfunction$malfunction==1])

# Proportions
p1=s1/n1
p2=s2/n2

# Test statistic and p-value
p=(p1*n1+p2*n2)/(n1+n2)
z=(p1-p2)/sqrt((p*(1-p))*(1/n1+1/n2))
p_value=2*pnorm(-abs(z))

# Output results
z
p_value



