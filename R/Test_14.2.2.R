#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 14.2.2: McNemar's test                   #
#################################################

# Dichotomize the variables IQ1 and IQ2
iq_before <- ifelse(iq$IQ1<=100, 0, 1) 
iq_after  <- ifelse(iq$IQ2<=100, 0, 1) 

# Apply the test
mcnemar.test(iq_before, iq_after, correct = FALSE)


