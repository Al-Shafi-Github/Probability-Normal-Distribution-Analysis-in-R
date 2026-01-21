library(tidyverse)

# Load dataset
cdc <- read.csv("cdc.csv", header = TRUE, sep = ",")

# Checking information
head(cdc)
str(cdc)
dim(cdc)
names(cdc)

# Making sure numeric columns are numeric
cdc$wtdesire <- as.numeric(as.character(cdc$wtdesire))
cdc$height   <- as.numeric(as.character(cdc$height))
cdc$weight   <- as.numeric(as.character(cdc$weight))

# Summaries
summary(cdc$wtdesire)
summary(cdc$height)

# Mean and standard deviation for wtdesire
mu <- mean(cdc$wtdesire, na.rm = TRUE)
sigma <- sd(cdc$wtdesire, na.rm = TRUE)

# If we pick up a row randomly from this dataset, # what is the probability that:


# 1) weight desired is less than 150?
pnorm(150, mu, sigma)
#Interpretation: About 43.68% have desired weight less than 150 lbs.


# 2) weight desired is greater than 150?
1 - pnorm(150, mu, sigma)
#Interpretation:  About 56.32% have desired weight greater than 150 lbs.


# 3) weight desired is between 140 and 180?
pnorm(180, mu, sigma) - pnorm(140, mu, sigma)
#Interpretation:  About 46.31% have desired weight between 140 and 180 lbs.


# 4) To be in the top 20% for females, what is the cutoff height ?
females <- filter(cdc, gender == "f")
mu_f <- mean(females$height, na.rm = TRUE)
sigma_f <- sd(females$height, na.rm = TRUE)
qnorm(0.8, mu_f, sigma_f)
#Interpretation:  Females need to be about 66.7 inches or taller to be in the top 20%.


# 5) What are the cutoff heights for the bottom 25% for males?
males <- filter(cdc, gender == "m")
mu_m <- mean(males$height, na.rm = TRUE)
sigma_m <- sd(males$height, na.rm = TRUE)
qnorm(0.25, mu_m, sigma_m)
#Interpretation: Males shorter than about 68.2 inches are in the bottom 25%.