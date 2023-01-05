#################################################################
# Statistical Hypothesis Testing with SAS and R                 #  
# by Dirk Taeger and Sonja Kuhnt                                # 
# (c) John Wiley & Sons, Ltd                                    # 
#                                                               # 
# Test 3.2.1: Two-sample F-test on variances of two populations # 
#################################################################

status0<-blood_pressure$mmhg[blood_pressure$status==0]
status1<-blood_pressure$mmhg[blood_pressure$status==1]

var.test(status0,status1,alternative="two.sided")