#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 13.1.2: Runs up and down test            #
#################################################

# Store the harvest figures in the variable x
x<-harvest$harvest

# Get number of observations
n<-length(x)

# Define some variables
upruns<-0       # holds the number of runs up
downruns<-0     # holds the numer of down runs

# This vectors holds different characters for an
# run up "+" and run down "-"
vec<-vector("character", length = n-1)

# Go through the observations and give for an
# runs up a "+" and for an runs down a "-"
# In case of ties give a "+" 
for (i in 2:n){
if (x[i] < x[i-1])  vec[i-1]="-"
if (x[i] > x[i-1])  vec[i-1]="+"
if (x[i] == x[i-1]) vec[i-1]="+" 
}

# Detect the starting run
if (vec[1]=="+") upruns<-1
if (vec[1]=="-") downruns<-1

# Go through the runs vector and counting
# runs up and runs down
for (j in 2:length(vec)){
 if (vec[j] != vec[j-1]){
  if (vec[j-1]=="+") upruns<-upruns+1
  if (vec[j-1]=="-") downruns<-downruns+1
 }
}

# Calculate test statistic and p-values
v<-upruns+downruns
mu<-(2*n-1)/3
sigma<-sqrt((16*n-29)/90)
z<-(v-mu)/sigma
p_value_A<-2*pnorm(-abs(z))
p_value_B<-1-pnorm(z);
p_value_C<-pnorm(z); 

# Output results
cat("Runs Up and Down Test \n\n",
"V       ","Z     ","p-value A"," ",
"p-value B"," ","p-value C","\n",
"---  --------- ----------- ----------- -----------","\n",
v,"  ",z," ",p_value_A," ",p_value_B," ",p_value_C,"\n")

