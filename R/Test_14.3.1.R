#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 14.3.1: Large sample test on the         #
#              odds ratio                       #
#################################################


# Get the cell counts for the 2x2 table
n11<-sum(malfunction$company=='A' & malfunction$malfunction==1)
n12<-sum(malfunction$company=='A' & malfunction$malfunction==0)
n21<-sum(malfunction$company=='B' & malfunction$malfunction==1)
n22<-sum(malfunction$company=='B' & malfunction$malfunction==0)

# Calculate the Odds Ratio
OR=(n11*n22)/(n12*n21)

# Calculate the standard deviation of ln(OR)
SD=sqrt(1/n11+1/n12+1/n22+1/n21)

# Calculate test statistic
z=log(OR)/SD

# Calculate p-values
p_value_A<-2*pnorm(-abs(z));
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z);


# Output results
OR
z
p_value_A
p_value_B
p_value_C 