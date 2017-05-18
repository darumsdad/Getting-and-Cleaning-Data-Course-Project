#read in the column names from the file
col_label  <- read.table(file = "features.txt", header = F, as.is = T, col.names = c("ID", "Name"))

#add a column that defines the classType that we will apply when we read these columns from the file
#if the class is NULL then we will not read that column
col_label <- mutate(col_label, classType = ifelse(regexpr(pattern = "std\\(\\)|mean\\(\\)",text = Name) > 0 ,"double", "NULL" ))

#read the data from the file. Note that we are applying the classType, if its NULL then the column will not be read
x1 <- read.table(file = file.path("test","X_test.txt"),sep = "",header = F,as.is = T, colClasses = col_label$classType)
x2 <- read.table(file = file.path("train","X_train.txt"),sep = "",header = F,as.is = T, colClasses = col_label$classType)
x <- rbind(x1,x2)


# add the Column Names
colnames(x) <- col_label[col_label$classType != "NULL","Name"]

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
