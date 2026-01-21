library(dplyr)
library(ggplot2)
library(tidyverse)
die<-c(1,2,3,4,5,6)
?sample()

sample_mean<-sample(die, 5, replace=TRUE)%>%mean()
#Repeat the process 1000 times:
# Roll the die 5 times and take the mean

sample_meanS<-replicate(1000, sample(die, 5, replace=TRUE)%>%
  mean())
View(sample_meanS)

sample_means_df<-data.frame(sample_meanS)

ggplot(sample_means_df, aes(x=sample_meanS))+geom_histogram()

# Another example
population<-runif(1000, min=0, max=1)

hist(population)

sample_size<-20
number_samples<-500

sample_means2<-replicate(number_samples, 
                         sample(population, sample_size, 
                                replace=TRUE)%>%
                           mean())

sample_means_df2<-data.frame(sample_means2)

ggplot(sample_means_df2, aes(x=sample_means2))+geom_histogram()

mean(sample_means_df2$sample_means2)
mean(population)
sd(sample_means_df2$sample_means2)


