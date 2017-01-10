# library key packages
library(dplyr)
library(tidyr)

# read in CSV file
titanic_original <- read.csv("titanic_original.csv")

# step 1: replace all missing values in 'embarked' column with 'S'

titanic_st1 <- titanic_original

titanic_st1$embarked[is.na(titanic_st1$embarked)] <- "S"
titanic_st1$embarked <- sub("^$", "S", titanic_st1$embarked)

unique(titanic_st1$embarked)

# step 2: calculate the mean of 'Age' column and replace all missing values with this number.
#         consider other ways missing values could have been populated and why they may or may
#         not be better ways of replacing missing values.

titanic_st2 <- titanic_st1

mean(titanic_st2$age, na.rm=TRUE)
# age column mean is 29.88113

median(titanic_st2$age, na.rm=TRUE)
# age column median is 28

titanic_st2$age[is.na(titanic_original$age)] <- mean(titanic_st2$age, na.rm=TRUE)

# this code has applied the 'mean' age to missing values in the age column, however it may be
# better to use the median value instead as most values in the age column are recorded as
# integers.

# step 3: replace missing values in 'boat' column with 'None' or 'NA' string.

titanic_st3 <- titanic_st2

titanic_st3$boat <- sub("^$", "None", titanic_st3$boat)


# step 4: consider the meaning of missing cabin numbers.  Create a new column 'has_cabin_number' 
#         with numerical definition '1' or '0'.

titanic_st4 <- titanic_st3

titanic_st4$has_cabin_number <- ifelse(titanic_st4$cabin == "", 0, 1)

# step 5: read & write cleaned data set to 'titanic_clean.csv'

titanic_clean <- titanic_st4
