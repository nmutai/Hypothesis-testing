#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 6.1.1: z-test on the parameter of an     #
#             exponential distribution          #
#################################################

n<-100       # Number of observations
T<-1         # Time interval
M<-25        # Number of failures
lambda0<-0.2 # Failure rate under the null hypotheis
p=1-exp(-lambda0*T) #Probability of failure

# Test statistic and p-value
z=(25-n*p)/sqrt(n*p*(1-p))
p_value=2*pnorm(-abs(z))

# Output results
z
p_value