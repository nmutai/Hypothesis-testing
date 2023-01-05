######################################################
# Statistical Hypothesis Testing with SAS and R      #
# by Dirk Taeger and Sonja Kuhnt                     #
# (c) John Wiley & Sons, Ltd                         #
#                                                    #
# File to make the datasets avaliable                #
######################################################

# Replace the following pathname with our own;
path <- "C:/Users/nmutai/Desktop/Statistical Hypothesis Testing/data/"

blood_pressure <- read.csv(paste(path, "blood_pressure.txt",
  sep = ""
),
header = TRUE,
sep = ",", dec = "."
)

iq <- read.csv(paste(path, "iq.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

malfunction <- read.csv(paste(path, "malfunction.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

infections <- read.csv(paste(path, "infections.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

students <- read.csv(paste(path, "students.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

workpieces <- read.csv(paste(path, "workpieces.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

coin <- read.csv(paste(path, "coin.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

harvest <- read.csv(paste(path, "harvest.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

silicosis <- read.csv(paste(path, "silicosis.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

waiting <- read.csv(paste(path, "waiting.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

pvalues <- read.csv(paste(path, "pvalues.txt", sep = ""), header = TRUE, sep = ",", dec = ".")

crop <- read.csv(paste(path, "crop.txt", sep = ""), header = TRUE, sep = ",", dec = ".")
