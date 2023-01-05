#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 14.1.1: Fisher's exact test              #
#################################################

# Read the two variables company and malfunction
x<-malfunction$company
y<-malfunction$malfunction

# Invoking the test 
fisher.test(x,y,alternative="two.sided")





