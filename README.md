📌 Overview

This project demonstrates basic statistical data analysis using R on the cdc.csv dataset.
The goal is to compute probabilities and cutoff values using the Normal distribution, assuming that selected variables (such as desired weight and height) are approximately normally distributed.

The analysis performed:

Data loading and inspection

Data type validation

Descriptive statistics

Probability calculations using pnorm

Percentile (cutoff) calculations using qnorm

Group-wise analysis (males vs females)

📂 Dataset

File name: cdc.csv

Source: CDC Behavioral Risk Factor Surveillance System (educational dataset)

Key Variables Used:

wtdesire – Desired weight (lbs)

height – Height (inches)

weight – Current weight (lbs)

gender – Gender ("m" or "f")

🛠 Tools & Libraries

R

RStudio

tidyverse (for data manipulation)

library(tidyverse)

🔍 Data Loading & Inspection
cdc <- read.csv("cdc.csv", header = TRUE, sep = ",")


Basic structure and sanity checks:

head(cdc)
str(cdc)
dim(cdc)
names(cdc)

🔢 Data Type Validation

Some numeric columns may be read as factors or characters.
We explicitly convert them to numeric values:

cdc$wtdesire <- as.numeric(as.character(cdc$wtdesire))
cdc$height   <- as.numeric(as.character(cdc$height))
cdc$weight   <- as.numeric(as.character(cdc$weight))

📈 Descriptive Statistics
summary(cdc$wtdesire)
summary(cdc$height)


Mean and standard deviation of desired weight:

mu <- mean(cdc$wtdesire, na.rm = TRUE)
sigma <- sd(cdc$wtdesire, na.rm = TRUE)

📐 Probability Analysis (Normal Distribution)

We assume desired weight is normally distributed.

1️⃣ Probability that desired weight is less than 150 lbs
pnorm(150, mu, sigma)


📌 Interpretation:
Approximately 43.7% of individuals desire a weight below 150 lbs.

2️⃣ Probability that desired weight is greater than 150 lbs
1 - pnorm(150, mu, sigma)


📌 Interpretation:
Approximately 56.3% desire a weight above 150 lbs.

3️⃣ Probability that desired weight is between 140 and 180 lbs
pnorm(180, mu, sigma) - pnorm(140, mu, sigma)


📌 Interpretation:
Approximately 46.3% fall within this desired weight range.

👩 Female Height Analysis

We filter only female participants:

females <- filter(cdc, gender == "f")


Mean and standard deviation:

mu_f <- mean(females$height, na.rm = TRUE)
sigma_f <- sd(females$height, na.rm = TRUE)

4️⃣ Cutoff height for top 20% of females
qnorm(0.8, mu_f, sigma_f)


📌 Interpretation:
Females need to be approximately 66.7 inches or taller to be in the top 20% by height.

👨 Male Height Analysis

Filter male participants:

males <- filter(cdc, gender == "m")


Mean and standard deviation:

mu_m <- mean(males$height, na.rm = TRUE)
sigma_m <- sd(males$height, na.rm = TRUE)

5️⃣ Cutoff height for bottom 25% of males
qnorm(0.25, mu_m, sigma_m)




✅ Key Concepts Demonstrated

Reading CSV files in R

Understanding data structures (data.frame)

Type coercion (as.numeric)

Mean and standard deviation

Normal distribution assumptions

Probability calculations using pnorm

Percentiles and cutoffs using qnorm

Group-wise analysis using filter()

📎 Files Included
📁 Project
 ├── assignment4.R
 ├── cdc.csv
 └── README.md



📜 License

This project is for educational use only.
