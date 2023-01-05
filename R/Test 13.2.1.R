#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 13.2.1: von Neumann test                 #
#################################################

# Store the harvest figures in the variable x
x<-harvest$harvest

# Get number of observations
n<-length(x)

# This vector holds the n-1 differences
numerator<-seq(0,0,length=n-1)

# Go through the observations and calculate
# the square of the differences
for (i in 1:n-1){
 numerator[i]<-(x[i+1]-x[i])^2
}

# Calculate the von Neuman test statistic
m<-mean(x)
VN<-sum(numerator)/sum((x-m)^2)

# Calculate the normal approximation
z=(1-(VN/2))/sqrt((n-2)/(n^2-1))

# Calculate p-values
p_value_A<-2*pnorm(-abs(z));
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z); 

# Output results
cat("von Neumann Test \n\n",
"von Neumann statistic ","    Z     ",
"p-value A","  ","p-value B","  ","p-value C","\n",
"---------------------  --------- ----------- ",
"----------- -----------","\n",
"     ",VN,"       ",z," ",p_value_A," ",
p_value_B," ",p_value_C,"\n")

