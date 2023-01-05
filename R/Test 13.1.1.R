#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 13.1.1: Wald-Wolfowitz runs test         #
#################################################

# Set the number of head and tail runs to zero
headruns=0
tailruns=0

# Get the number of observations adn the number
# of head and tails
n<-length(coin$head)
n1<-length(coin$head[coin$head==1])
n2<-length(coin$head[coin$head==0])

# Look at the first observation to decide if
# a head run or a tail run starts
if (coin$head[1]==1) headruns<-1
if (coin$head[1]==0) tailruns<-1

# Go through the dataset for all other observations
# if teh value is not the value of teh former
# observation a new run starts
for (i in 2:n){
 if (coin$head[i] != coin$head[i-1]){
  if (coin$head[i]==1) headruns<-headruns+1 
 if (coin$head[i]==0) tailruns<-tailruns+1  
}

}

# Calculate test statistic and p-values
r<-headruns+tailruns
mu<-2*n1*n2/n+1
sigma<-sqrt((mu-1)*(mu-2)/(n-1))

z<-(r-mu)/sigma;

p_value_A<-2*pnorm(-abs(z));
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z); 

# Output results
cat("Wald-Wolfowitz Runs Test","\n------------------------","\n")
z
r
p_value_A
p_value_B
p_value_C
 


