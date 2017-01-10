# Script for cleaning up 'titanic_original.csv'.  Load CSV into R.

titanic_original <- read.csv("titanic_original.csv")

library(dplyr)
library(tidyr)

# Step 1: The embarked column has some missing values, which are known to 
# correspond to passengers who actually embarked at Southampton. Find the 
# missing values and replace them with S.

titanic_original$embarked[which(is.na(titanic_original$embarked))] <- "S"

# step 2:  a lot of the values in the Age column are missing. Using the mean
# or median of the rest of the values is quite common in such cases.

# 1) Calculate the mean of the Age column and use that value to populate the
#    missing values.
# 2) Think about other ways you could have populated the missing values in 
#    the age column. Why would you pick any of those over the mean (or not)?

mean(titanic_original$age, na.rm=TRUE)
# age column mean is 29.88113

median(titanic_original$age, na.rm=TRUE)
# age column median is 28

titanic_original$age[which(is.na(titanic_original$age))] <- mean(titanic_original$age, na.rm=TRUE)

# this code has applied the mean age to missing values in the age column, however it may be
# better to use the median value instead as most values in the age column are recorded as
# integers.

# step 3: there are a lot of missing values in the boat column. Fill these
# empty slots with a dummy value e.g. the string 'None' or 'NA'

RpFun <- function(x) {
  ifelse(x == "", NA, x)
}

titanic_original$boat <- titanic_original %>% transmute(boat = RpFun(titanic_original$boat))

# step 4: Create a new column 'has_cabin_number' which has 1 if there is a
# 'cabin number', and 0 otherwise.



# step 5: create a cleaned up version as 'titanic_clean.csv'