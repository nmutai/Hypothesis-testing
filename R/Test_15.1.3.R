#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 15.1.3: Dixon's tests                    #
#################################################

# Calculate sample size
n<-length(students$height)

# Sort height
x<-sort(students$height)

# Calculate test statistics r10 and r22
r10<-(x[2]-x[1])/(x[n]-x[1])
r22<-(x[3]-x[1])/(x[n-2]-x[1])

# Calculate p-values
if (r10<=0.300)             p_value_r10<-">=0.0500"
if (r10>0.300 & r10<=0.391) p_value_r10<-" <0.0500"
if (r10>=0.391)             p_value_r10<-" <0.0100"

if (r22<=0.535)             p_value_r22<-">=0.0500"
if (r22>0.535 & r10<=0.450) p_value_r22<-" <0.0500"
if (r22>=0.450)             p_value_r22<-" <0.0100"

# Output results
"Test on lower outlier avoiding x(1)"
r10
p_value_r10

"Test on lower outliers avoiding x(2), x(n), x(n-1)"
r22
p_value_r22

