#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 8.1.1: Sign test                         #
#################################################

# Set value mu0 to test against
mu0<-120

# Calculate differences between values and mu0
d<-blood_pressure$mmhg-mu0

# Calculate number of differences not equal to zero
n<-length(d[d!=0])

# Calculate test statistic
v<-length(d[d>0])

# Calculation of p-values
pvalue_A<-binom.test(v,n,0.5,alternative="two.sided")

# Decide which tail must be used for one-tailed tests
diff<-median(blood_pressure$mmhg)-mu0

if (diff >=0){
    pvalue_B<-binom.test(v,n,0.5,alternative="greater")
    pvalue_C<-binom.test(v,n,0.5,alternative="less") 
}

if (diff < 0) {
    pvalue_B<-binom.test(v,n,0.5,alternative="less")
    pvalue_C<-binom.test(v,n,0.5,alternative="greater") 
} 

# Output results
pvalue_A$p.value
pvalue_B$p.value
pvalue_C$p.value

