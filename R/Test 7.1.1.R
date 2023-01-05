#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 7.1.1: Pearson's product moment          #
#             correlation coefficient           #
#################################################

# a) Test the hypothesis H0: Rho=0
cor.test(students$height,students$weight,alternative="two.sided",method="pearson")


# b) Test the hypothesis H0: Rho=0.5;

# Define rho_0
rho_0=0.5;

# Calculate correlation coefficient
rho<-cor(students$height,students$weight)

# Calculate number of observations
n<-length(students$height)

# Calculate bias factor
b<-rho_0/(2*(n-1))

# Test statistic without bias factor
Z<-0.5*(log((1+rho)/(1-rho))-log((1+rho_0)/(1-rho_0)))*sqrt(n-3)

# p-values for hypothesis (A), (B), and (C)
pvalue_A=2*min(pnorm(-abs(Z)),1-pnorm(-abs(Z)))

if (rho >= 0){
  pvalue_B=pnorm(-abs(Z))
  pvalue_C=1-pnorm(-abs(Z))
}

if (rho < 0) {
 pvalue_B=1-pnorm(-abs(Z))
 pvalue_C=pnorm(-abs(Z))
} 

# Output results
"p-Values for tests without bias factor"
pvalue_A
pvalue_B
pvalue_C

# Test statistic with bias factor
Z_b<-(0.5*(log((1+rho)/(1-rho))-log((1+rho_0)/(1-rho_0)))-b)*sqrt(n-3)

# p-values for hypothesis A), B), and C)
pvalue_A=2*min(pnorm(-abs(Z_b)),1-pnorm(-abs(Z_b)))

if (rho >= 0){
  pvalue_B=pnorm(-abs(Z_b))
  pvalue_C=1-pnorm(-abs(Z_b))
}

if (rho < 0) {
 pvalue_B=1-pnorm(-abs(Z_b))
 pvalue_C=pnorm(-abs(Z_b))
} 

# Output results
"p-Values for tests with bias factor"
pvalue_A
pvalue_B
pvalue_C

