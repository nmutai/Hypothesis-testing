#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 7.3.1: Partial correlation               #
#################################################

# Calculate correlation between variables
rho_wh<-cor(students$weight,students$height,method="pearson")
rho_ws<-cor(students$weight,students$sex,method="pearson")
rho_hs<-cor(students$height,students$sex,method="pearson")

# Calculate number of observations
n<-length(students$height)

# Calculate partial correlation
rho_wh.s=(rho_wh-rho_ws*rho_hs)/sqrt((1-rho_ws^2)*(1-rho_hs^2))

# Calculate test statistic
t=(rho_wh.s*sqrt(n-3))/sqrt((1-rho_wh.s^2))

# Calculate p-values
pvalue_A=2*min(pt(-abs(t),n-3),1-pt(-abs(t),n-3))

if (rho_wh.s >= 0){
  pvalue_B=pt(-abs(t),n-3)
  pvalue_C=1-pt(-abs(t),n-3)
}

if (rho_wh.s < 0) {
 pvalue_B=1-pt(-abs(t),n-3)
 pvalue_C=pt(-abs(t),n-3)
} 

# Output results
rho_wh.s
pvalue_A
pvalue_B
pvalue_C







