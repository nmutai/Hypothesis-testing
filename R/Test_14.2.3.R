#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 14.2.3: Bowker’s test for symmetry       #
#################################################

# Construct the contingency table
table<-matrix(c(10,13,1,8,14,10,12,6,20),ncol=3)
 
# Apply the test
mcnemar.test(table)


