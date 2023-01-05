#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 14.2.1: Test on Cohen's kappa            #
#################################################

# Get the number of observations
n<-length(silicosis$patient)

# Construct a 2x2 table
freqtable <- table(silicosis$reviewer1,silicosis$reviewer2)

# Calculate the observed frequencies
po<-(freqtable[1,1]+freqtable[2,2])/n

# Calculate the expected frequencies
row<-margin.table(freqtable,1)/n
col<-margin.table(freqtable,2)/n
pe<-row[1]*col[1]+row[2]*col[2]

# Calculate the simple kappa coefficient
k<-(po-pe)/(1-pe)

# Calculate the variance under the null hypothesis
var0<-( pe+pe^2 - (row[1]*col[1]*(row[1]+col[1])+
                   row[2]*col[2]*(row[2]+col[2])))/(n*(1-pe)^2)

# Calculate test statistic
z<-k/sqrt(var0)

# calculate p_values
p_value_A<-2*pnorm(-abs(z))
p_value_B<-1-pnorm(z)
p_value_C<-pnorm(z)

# Output results
k
z
p_value_A
p_value_B
p_value_C

