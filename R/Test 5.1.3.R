#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 5.1.3: z-test on the difference between  #
#             two Poisson parameters            #
#################################################


# Define free kicks of team A and B
fk_A<-88
fk_B<-76

* Number of soccer games of team A and team B;
n_A=15;
n_B=10;

# Test statistic and p-values
z<-(fk_A/n_A-fk_B/n_B)/sqrt(fk_A/n_A^2+fk_B/n_B^2)
p_value_A=2*pnorm(-abs(z))
p_value_B=1-pnorm(z)
p_value_C=pnorm(z)

# Output results
z
p_value_A
p_value_B
p_value_C