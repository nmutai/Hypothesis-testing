#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 2.2.3: Welch test                        # 
#################################################

status0<-blood_pressure$mmhg[blood_pressure$status==0]
status1<-blood_pressure$mmhg[blood_pressure$status==1]

t.test(status0,status1,mu=0,alternative="two.sided",var.equal=FALSE)
