###################################################
# Statistical Hypothesis Testing with SAS and R   #  
# by Dirk Taeger and Sonja Kuhnt                  # 
# (c) John Wiley & Sons, Ltd                      # 
#                                                 # 
# Test 5.1.2: Exact test on the Poisson parameter #
###################################################

# Number of observed total infections
x<-sum(infections$infections*infections$total)

# Number of hospitals
n_hospital<-sum(infections$total)

# Set lambda under the null hypothesis
lambda0<-4

# Test of Hypothesis A
poisson.test(x,n_hospital*lambda0,alternative="two.sided")

# Test of Hypothesis B
poisson.test(x,n_hospital*lambda0,alternative="greater")

# Test of Hypothesis C
poisson.test(x,n_hospital*lambda0,alternative="less")



