#################################################
# Statistical Hypothesis Testing with SAS and R #  
# by Dirk Taeger and Sonja Kuhnt                # 
# (c) John Wiley & Sons, Ltd                    # 
#                                               # 
# Test 9.1.3: Mood test                         #
#################################################

x<-blood_pressure$mmhg[blood_pressure$status==0]
y<-blood_pressure$mmhg[blood_pressure$status==1]

mood.test(x,y,alternative ="two.sided")