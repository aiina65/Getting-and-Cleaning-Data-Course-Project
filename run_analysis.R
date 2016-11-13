# Download the data
#setwd("/Users/ainalopez/Downloads")
#url_dir <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url_dir, destfile = "/Users/ainalopez/Downloads/UCI_HAR_Dataset.zip")
#unzip("/Users/ainalopez/Downloads/UCI_HAR_Dataset.zip")

# Load data
setwd("Downloads/UCI HAR Dataset/") # Insert here the directory where you downloaded the data
features <- read.table("features.txt", sep = " ")
activities <- read.table("activity_labels.txt", sep = " ")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subjects_test <- read.table("test/subject_test.txt")

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subjects_train <- read.table("train/subject_train.txt")


# STEP 1. Merge the training and the test sets to create one data set.
dataset_test <- data.frame(subject = subjects_test,  label = y_test)
dataset_train <- data.frame(subject = subjects_train, label = y_train )

dataset_final <- rbind(dataset_test, dataset_train)
names(dataset_final) <- c("subject", "label")

all_features <- rbind(X_test, X_train)
names(all_features) <- features[,2]


# STEP 2. Extract the measurement on the mean and standard deviation for each measurement.
mean_id <- grep("mean",features$V2)
std_id <- grep("std",features$V2)

dataset_final <- cbind(dataset_final, all_features[, c(mean_id, std_id)])


# STEP 3. Uses descriptive activity names to name the activities in the data set
names(activities) <- c("label", "activity")
activities$activity <- tolower(activities$activity)

dataset_final <- merge(dataset_final, activities, by.x = 'label', by.y = 'label', all.x = TRUE)


# STEP 4. Appropriately labels the data set with descriptive variable names: 
# In order to make the data cleaning easier, I've been doing this step in parallel to the other steps, 
# by setting understandable and concise variable names. The resulting dataset is dataset_final.

# Put the subject, label and activity a the beginning

dataset_final <- dataset_final[, c(2, 1, 82, 3:81)]
dataset_final <- dataset_final[order(dataset_final$subject, dataset_final$label),]

# STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

dataset_har_final <- aggregate(. ~ subject + label + activity, dataset_final, mean)

# Write the dataset
write.table(dataset_har_final, file = "dataset_har_final.txt", row.name=FALSE)

