# Textbook work
# table 10.2 
library(readr)
bigbank <-read_csv("UniversalBank.csv")
bigbank <- bigbank[ ,-c(1,5)] 
# Lets remove ID and zip code columns

# treat education as categorical

bigbank$Education <- factor(bigbank$Education, levels = c(1,2,3),
                            labels = c("Undergrad","Graduate","Avdvanced/Professional"))
# Changing name for "Personal Loan"
bigbank$PL <- bigbank$`Personal Loan`

# partition data
set.seed(2)
train.index <- sample(c(1:dim(bigbank)[1]), dim(bigbank)[1]*0.6)
train.df <- bigbank[train.index,]
valid.df <- bigbank[-train.index,]

# running logistic regression
# glm, family = "binomial"

logit.reg <- glm(PL ~ ., data = train.df, family = "binomial")
options(scipen = 999)
summary(logit.reg)
