#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 15.1.2: David-Hartley-Pearson test       #
#################################################

# Calculate the necessary values, like maximum and minimum
x_max<-max(students$height)
x_min<-min(students$height)
x_sd<-sd(students$height)
n<-length(students$height)

# Calculate the test statistic
q<-(x_max-x_min)/x_sd

# Calculate p-values
t<-sqrt(((n-2)*q^2)/(2*n-2-q^2))

p_value=n*(n-1)*(1-pt(t,n-2))

# Output results
"David-Hartley-Pearson Test"
q
p_value
