library(reshape2)
## Download and unzip the dataset:

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL,"./data/UCI HAR Dataset.zip")
unzip("./data/getdata_dataset.zip") 

## Reading the dataset from the unzipped file

# Read the train Dataset
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


# Read the test Dataset
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y-test <- read.table("UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")



# Read activity labels
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[,2] <- as.character(activity[,2])

#Read Fetures
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract mean and standard deviation values
mean_std_dev<- grep(".*mean.*|.*std.*", features[,2])
mean_std_dev_features <- features[mean_std_dev,2]

#Select only mean and standardeviation data from the X variable
X_train<-X_train[mean_std_dev]
X_test<-X_test[mean_std_dev]

#Merge the data into a single data set
train <- cbind(Subject_train,Y_train,X_train)
test <- cbind(Subject_test,Y_test,X_test)
all_data <- rbind(train, test)
colnames(all_data) <- c("subject", "activity", mean_std_dev_features)

#Factor activity and subject
all_data$activity <- factor(all_data$activity, levels = activity[,1], labels = activity[,2])
allData$subject <- as.factor(all_data$subject)

#reshaping and casting
melt_data <- melt(all_data, id = c("subject", "activity"))
mean_data <- dcast(melt_data, subject + activity ~ variable, mean)

#write the table to a text file
write.table(mean_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)
