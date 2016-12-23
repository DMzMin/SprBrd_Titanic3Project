# library key packages
library(dplyr)
library(tidyr)

# read in CSV file
titanic_original <- read.csv("titanic_original.csv")

# step 1: replace all missing values in 'embarked' column with 'S'



# step 2: calculate the mean of 'Age' column and replace all missing values with this number.
#         consider other ways missing values could have been populated and why they may or may
#         not be better ways of replacing missing values.



# step 3: replace missing values in 'boat' column with 'None' or 'NA' string.




# step 4: consider the meaning of missing cabin numbers.  Create a new column 'has_cabin_number' 
#         with numerical definition '1' or '0'.




# step 5: read & write cleaned data set to 'titanic_clean.csv'