
This document describes the code contained in run_analysis.R.

1. Read in the column names from the file (from the "features.txt" file)
2. We need to only read a subset of columns from the data file. To accomplish this I prepapre a vector of classNames that will be applied to the read. If the className is NULL then read.table function will skip that column. If the column is one that we want to read (mean or std)  I set the entry in the vecor to "double" if not its NULL
3. Read the data files applying the className vector above
4. Add the column names
5. Read the Activity Number and append that to the data set
# add the activity number column
y1 <- read.table(file = file.path("test","y_test.txt"),sep = "",header = F,as.is = T, col.names = "ActivityNumber")
y2 <- read.table(file = file.path("train","y_train.txt"),sep = "",header = F,as.is = T, col.names = "ActivityNumber") 
y <- rbind(y1,y2)


# add the activity number column
s1 <- read.table(file = file.path("test","subject_test.txt"),sep = "",header = F,as.is = T, col.names = "Subject")
s2 <- read.table(file = file.path("train","subject_train.txt"),sep = "",header = F,as.is = T, col.names = "Subject") 
s <- rbind(s1,s2)

# add the Subject and ActivityNumber columns
x <- cbind(x,y,s)

lookup <- read.table(file = "activity_labels.txt", header = F, as.is = T, col.names = c("ActivityNumber","ActivityName"))

data <- merge(x,lookup)
