#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 13.2.2: von Neumann rank test            #
#              (Bartels' test)                  #
#################################################

# Store the harvest figures in the variable x
x<-harvest$harvest

# Get number of observations
n<-length(x)

# Calculate the ranks of the observations
r<-rank(x,ties.method="average")

# This vector holds the n-1 differences
numerator<-seq(0,0,length=n-1)

# Go trough the observations and calculate
# the squared differences
for (i in 1:n-1){
 numerator[i]<-(r[i+1]-r[i])^2
}

# Calculate the von Neumann rank test statistic
m<-mean(r)
RVN<-sum(numerator)/sum((r-m)^2)

# Calculate the normal approximation
z<-(RVN-2)/sqrt(4/n)

# Calculate p-Values
p_value_A<-2*pnorm(-abs(z));
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z); 

# Output results
cat("von Neumann Rank Test \n\n",
"von Neumann rank statistic ","    Z      ",
"p-value A","  ","p-value B","  ","p-value C","\n",
"--------------------------  ---------  ----------- ",
"----------- -----------","\n",
"         ",RVN,"         ",z," ",p_value_A," ",
p_value_B," ",p_value_C,"\n")




