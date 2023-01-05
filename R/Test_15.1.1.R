#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 15.1.1: Grubbs' test                     #
################################################# 

# Calculate basic statistics, like maximum and minimum
x_max<-max(students$height)
x_min<-min(students$height)
x_mean<-mean(students$height)
x_sd<-sd(students$height)
n<-length(students$height)

# Calculate the test statistics
g_B<-(x_max-x_mean)/x_sd
g_C<-(x_mean-x_min)/x_sd
g_A<-max(g_B,g_C)

# Calculate p-values
t_A<-sqrt((n*(n-2)*g_A^2)/((n-1)^2-n*g_A^2))
t_B<-sqrt((n*(n-2)*g_B^2)/((n-1)^2-n*g_B^2))
t_C<-sqrt((n*(n-2)*g_C^2)/((n-1)^2-n*g_C^2))

p_value_A<-2*n*(1-pt(t_A,n-2))
p_value_B<-n*(1-pt(t_B,n-2))
p_value_C<-n*(1-pt(t_C,n-2))

# Output results
"Two-sided test on extreme outlier"
g_A
p_value_A
"One-sided test on maximum is outlier"
g_B
p_value_B
"One-sided test on minimum is outlier"
g_C
p_value_C
