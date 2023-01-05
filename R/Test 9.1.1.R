#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 9.1.1: Siegel-Tukey test                 #
#################################################

# Helper functions to find even or odd numbers
is.even <- function(x) x %% 2 == 0
is.odd  <- function(x) x %% 2 == 1

# Make a sorted matrix with first column the blood
# pressure and second column the status
data<-blood_pressure[order(blood_pressure$mmhg),]
x<-c(data$mmhg)
x<-cbind(x,data$status)

# If sample size is odd then remove the observation
# in the middle
if (is.odd(nrow(x))) x<-x[-c(nrow(x)/2+0.5),] 

# Calculate the (remaining) sample size
n<-nrow(x)

# y will hold the Siegel-Tukey scores
y<-rep(0,times=n)

# Assigning the scores
for (i in seq(along=x)) {
 if (1<i & i <= n/2 & is.even(i))
 {
  y[i]<-2*i
 }
 else if (n/2<i & i<=n & is.even(i))
 {
  y[i]<-2*(n-i)+2
 } 
 else if (1<=i & i <=n/2 & is.odd(i))
 {
  y[i]<-2*i-1
 }
 else if (n/2<i & i< n & is.odd(i))
 {
  y[i]<-2*(n-i)+1 
 } 
}

# Now mean scores must be created if necessary
t<-tapply(y,x[,1],mean) # Get mean scores for tied values
v<-strsplit(names(t), " ") # Get mmhg values 

# r 
r<-rep(0,times=n)

# Assign ranks and mean ranks to r
for (i in seq(along=r))
{
 for (j in seq(along=v))
 {
 if (x[i,1]==as.numeric(v[j])) r[i]=t[j]
 }  
}

# Now calculate the test statistics S_0 (status 0) 
# and S_1 (status 1) for both samples
S_0<-0
S_1<-0

for (i in seq(along=r)) {
 if(x[i,2]==0) S_0=S_0+r[i]
 if(x[i,2]==1) S_1=S_1+r[i]
}

# Calculate sample sizes for status=0 and status=1
n1<-sum(x[,2]==0)
n2<-sum(x[,2]==1)

# Choose the test statistic which belongs to the smallest
# sample size
if (n1<=n2) {
  #Choose the smaller |z| value
  z1<-(2*S_0-n1*(n+1)+1)/sqrt((n1*n2*(n+1)/3))
  z2<-(2*S_0-n1*(n+1)-1)/sqrt((n1*n2*(n+1)/3))
  if (abs(z1)<=abs(z2)) z=z1 else z=z2

  pvalue_B=1-pnorm(-abs(z))
  pvalue_C=pnorm(-abs(z))
}

if (n1>n2) {
  #Choose the smaller |z| value
  z1<-(2*S_1-n2*(n+1)+1)/sqrt((n1*n2*(n+1)/3))
  z2<-(2*S_1-n2*(n+1)-1)/sqrt((n1*n2*(n+1)/3))
  if (abs(z1)<=abs(z2)) z=z1 else z=z2

  pvalue_B=pnorm(-abs(z));
  pvalue_C=1-pnorm(-abs(z)); 
}



pvalue_A=2*min(pnorm(-abs(z)),1-pnorm(-abs(z)));

# Output results
print("Siegel-Tukey test")
n
S_0
S_1
z
pvalue_A
pvalue_B
pvalue_C

