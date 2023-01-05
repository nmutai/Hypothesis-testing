#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
#                                               #
# Test 5.1.1: z-test on the Poisson parameter   # 
#################################################

# Number of observed total infections
x<-sum(infections$infections*infections$total)
n_hospital<-sum(infections$total)

# Set lambda under the null hypothesis
lambda0<-4 

# Test statistic and p-value
z<-(x-n_hospital*lambda0)/sqrt(n_hospital*lambda0)
p_value_A=2*pnorm(-abs(z))
p_value_B=1-pnorm(z)
p_value_C=pnorm(z)

# Output results
z
p_value_A
p_value_B
p_value_C