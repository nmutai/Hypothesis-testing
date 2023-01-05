#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 7.2.1: z-test for two correlation        #
#             coefficients (independent         # 
#             populations)                      #
#################################################


# Calculate correlation coefficient for males
male.height<-students$height[students$sex==1]
male.weight<-students$weight[students$sex==1]
rho1<-cor(male.height,male.weight)

# Calculate number of observations for males
n1<-length(students$height[students$sex==1])

# Calculate correlation coefficient for females
female.height<-students$height[students$sex==2]
female.weight<-students$weight[students$sex==2]
rho2<-cor(female.height,female.weight)

# Calculate number of observations for females
n2<-length(students$height[students$sex==2])


# Test statistic
Z<-0.5*(log((1+rho1)/(1-rho1))-log((1+rho2)/(1-rho2)))/(sqrt(1/(n1-3)+1/(n2-3)))
diff=rho1-rho2


# p-values for hypothesis A), B), and C)
pvalue_A=2*min(pnorm(-abs(Z)),1-pnorm(-abs(Z)))

if (diff >=0){
  pvalue_B=pnorm(-abs(Z))
  pvalue_C=1-pnorm(-abs(Z))
}

if (diff < 0) {
 pvalue_B=1-pnorm(-abs(Z))
 pvalue_C=pnorm(-abs(Z))
} 


# Output results
"Correlation coefficient for males:"
rho1
"Correlation coefficient for females:"
rho2
"p-Values"
pvalue_A
pvalue_B
pvalue_C


