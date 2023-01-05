#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 14.3.2: Large sample test on the         #
#              relative risk                    #
#################################################


# Get the cell counts for the 2x2 table
n11<-sum(malfunction$company=='A' & malfunction$malfunction==1)
n12<-sum(malfunction$company=='A' & malfunction$malfunction==0)
n21<-sum(malfunction$company=='B' & malfunction$malfunction==1)
n22<-sum(malfunction$company=='B' & malfunction$malfunction==0)

# Calculate the Relative Risk
RR=(n11/(n11+n12))/(n21/(n21+n22))

# Calculate the standard deviation of ln(RR)
SD=sqrt(1/n11-1/(n11+n12)+1/n21-1/(n21+n22))


# Calculate test statistic
z=log(RR)/SD

# Calculate p-values
p_value_A<-2*pnorm(-abs(z));
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z);


# Output results
RR
z
p_value_A
p_value_B
p_value_C 