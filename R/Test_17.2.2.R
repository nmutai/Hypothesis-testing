#################################################
# Statistical Hypothesis Testing with SAS and R #
# by Dirk Taeger and Sonja Kuhnt                #
# (c) John Wiley & Sons, Ltd                    #
#                                               #
# Test 17.2.2: Levene test                      #
#################################################


# Calculate group means of of each field
m<-tapply(crop$kg,crop$house,mean)

# Make the Z's
z<-abs(crop$kg-m[crop$house])

# Overall mean of the Z's
z_mean=mean(z)

# Group mean of the Z's
z_gm<-tapply(z,crop$house,mean)

# Make a matrix of the Z's (group in the rows)
z_matrix<-rbind(z[crop$house==1],z[crop$house==2],z[crop$house==3])

# Calculate the numerator
nu<-0
for (i in 1:3)
 {
  u<-5*(z_gm[i]-z_mean)^2
  nu<-nu+u
 }

# Calculate the denumerator
de<-0
for (j in 1:3)
{
 for (i in 1:5)
  {
   e<-(z_matrix[j,i]-z_gm[j])^2
   de<-de+e
  }
}

# Calculate test statistic and p-value
l<-(12*nu)/(2*de)
p_value<-1-pf(l,2,12)

# Output results
"Levene Test"
l
p_value