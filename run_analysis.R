#Reading all the Test files
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

#Reading all the Train files
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

#Reading feature.txt file and assigning the Column V2 value of feature.txt to the Column names of X_test and X_train files
features <- read.table("features.txt")
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

#Reading activity_labels.txt & assigning names to the activity_names data frame
activity_names <- read.table("activity_labels.txt")
colnames(activity_names) <- c("V1","Activity_Names")

#Assigning names to the y_test and y_train data frames
colnames(y_test) <- c("Activity_Labels")
colnames(y_train) <- c("Activity_Labels")

#Assigning names to the subject_test and subject_train data frames
colnames(subject_test) <- c("Subjects")
colnames(subject_train) <- c("Subjects")

#Column binding the X_train(7352x561) and y_train(7352x1) tables
train_merged_data <- cbind(X_train,y_train)
#Column binding the train_merged_data(7352x562) and subject_train(7352x1) tables
train_merged_data <- cbind(train_merged_data,subject_train)

#Subselect variables that either have "mean" or "std" names in the features data frame in train_merged_data data frame
train_merged_data_subset_mean_std <- train_merged_data[,grepl("-mean()", features$V2) | grepl("-std()", features$V2)]

#Repeating the same process that was done in train data set to test data set
test_merged_data <- cbind(X_test,y_test) #Column binding
test_merged_data <- cbind(test_merged_data,subject_test)#Column binding
test_merged_data_subset_mean_std <- test_merged_data[,grepl("-mean()", features$V2) | grepl("-std()", features$V2)]#Subselecting "mean" and "std"

#Row Binding both the train and test data sets
test_train_merged_data <- rbind(train_merged_data_subset_mean_std,test_merged_data_subset_mean_std)

#Merging test_train_merged_data data set with activity_names set by activity lablels. Since the lables are already binded in the orginal set, sorting that happens after merging will not affect the position of data
test_train_merged_data <- merge(test_train_merged_data,activity_names, by.x ="Activity_Labels", by.y = "V1")

library(reshape2)
library(dplyr)

#melting the data set based on measured variables
melted_data <- melt(test_train_merged_data, id =c("Subjects","Activity_Names"), measure.vars = filter(features, grepl("-mean()", features$V2) | grepl("-std()", features$V2))$V2)

#reording the final data set based on subjects and activity names
tidy_data <- dcast(melted_data,Subjects + Activity_Names ~ variable, mean )
write.table(tidy_data, "tidy.txt", row.name=FALSE)
