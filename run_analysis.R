#Loading dependencies

library(data.table)
library(dplyr)

#******************************************************************
#1. Merge the training and the test sets to create one data set.
#******************************************************************

# Reading the test training tables

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test  <- read.table("UCI HAR Dataset/test/X_test.txt")
x_data  <- rbind(x_train, x_test) 


y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test  <- read.table("UCI HAR Dataset/test/y_test.txt")
y_data  <- rbind(y_train, y_test)


subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_data  <- rbind(subject_train, subject_test)

#Extracting Data

Features <-  read.table("UCI HAR Dataset/features.txt")

means <- grep("-mean\\(\\)|-std\\(\\)", Features[, 2])

combined_data <- x_data[, means] 

#******************************************************************
#2. Assign column names
#******************************************************************

colnames(combined_data) <- Features[means, 2]

colnames(combined_data) <- gsub("\\(|\\)", "", colnames(combined_data)) 
colnames(combined_data) <- gsub("-", ".", colnames(combined_data))
colnames(combined_data) <- tolower(colnames(combined_data))


#Naming Data

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

activity_labels[, 2] <- tolower(gsub("_", "", activity_labels[, 2]))

Activitylabel <- activity_labels[y_data[, 1], 2]

y_data[, 1] <- Activitylabel

colnames(y_data) <- "Activity"

#******************************************************************
#3. Create a tidy dataset
#******************************************************************
#Naming data continued

colnames(subject_data) <- "subject"

datajoined <- cbind(subject_data, combined_data, y_data)

write.table(datajoined, "combineddata.txt")

#Melting the data frames

setDT(datajoined)
meltdfrm <- melt(datajoined, id=c("Activity", "subject"))

tidyfrm <- dcast(meltdfrm, Activity + subject ~ variable, mean)

write.table(tidyfrm, "tidydataset", row.names = F, col.names= T, sep = "\t")

