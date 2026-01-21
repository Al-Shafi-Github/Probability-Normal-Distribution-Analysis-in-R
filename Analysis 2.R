library(tidyverse)

#load bdims.csv file
bdim<-read.csv("bdims.csv", header = TRUE, sep=",")

# Create a histogram of the height variable and tell if this is nearly Normal.
ggplot(bdim, aes(x=hgt))+geom_histogram()


# 1) When we randomly pick up a person out of this dataset, what are the chances
#    this person's height is less than 160 cm?
mu<-mean(bdim$hgt)
sigma<-sd(bdim$hgt)
z<-(160-mu)/sigma
pnorm(z)
#alternatively
pnorm(160, mu, sigma)
#AUC up to z from neg. infinity is 11.8%



# 2) When we randomly pick up a person out of this dataset, what are the chances
#    this person's height is greater than 180 cm?

1-pnorm(180, mu, sigma)
#AUC from 180 to +inf. is 17.32%

# 3) When we randomly pick up a person out this of dataset, what are the chances
#    this person's height is greater than 165 and less than 185 cm ?
#165<P(x)<185 ?
pnorm(185, mu,sigma)-pnorm(165, mu, sigma)


# 4) What is the cutoff height for bottom 5% ?
qnorm(0.05, mu, sigma)
#155.6703 cm and less covers the 5%

# 5) What is cutoff height for top 10% ?
# 1-0.1=0.9
qnorm(0.9, mu, sigma)
#183.1996 cm and above covers the top 10%

#### More Normal distribution examples:


# When I pick up someone from this dataset, what are chances this person :

# 1) weighs less than 80 kilograms?
mu2<-mean(bdim$wgt)
sigma2<-sd(bdim$wgt)
pnorm(80, mu2, sigma2)
# 79.19% chance to pick someone who weighs 80 or less
# 2) weighs more than 70 kg?
1-pnorm(70, mu2, sigma2)
# 47.45% chance to pick someone who weighs 70 or more

# 3) weighs between 65 kg and 75 kg ?
pnorm(75, mu2, sigma2)-pnorm(65, mu2, sigma2)
# the probability of picking someone who weighs between 65 and 75
# is 29.15%

# 4) what is the cutoff weight to be on the heaviest 5 percent?
#1-0.5=0.95 is the value we need calculate from neg. inf
qnorm(0.95, mu2, sigma2)
# cutoff value 91.099 kg, values above the cuttoff covers top 5%


# 5) What is the cutoff age for the youngest 20% ?
mu3<-mean(bdim$age)
sigma3<-sd(bdim$age)
qnorm(0.2, mu3, sigma3)
# the cutoff age for the youngest 20% is 22.09



