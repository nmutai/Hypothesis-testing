#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               #
# Test 4.2.1: z-test for the differences of two #
#             populations (unpooled variances)  #
#################################################


# Number of observations for company A
n1<-length(malfunction$malfunction[malfunction$company=='A'])
# Number of successes for company A
s1<-length(malfunction$malfunction[malfunction$company=='A' & malfunction$malfunction==1])

# Number of observations for company B
n2<-length(malfunction$malfunction[malfunction$company=='B'])
# Number of successes forcompany B
s2<-length(malfunction$malfunction[malfunction$company=='B' & malfunction$malfunction==1])

# Proportions
p1=s1/n1
p2=s2/n2

# Difference of proportions
p_diff=p1-p2
# Difference to test
d0=0.10

# Test statistic an p-values
z=(p_diff-d0)/sqrt((p1*(1-p1))/n1 + (p2*(1-p2))/n2)
p_value=2*pnorm(-abs(z))


# Output results
z
p_value



