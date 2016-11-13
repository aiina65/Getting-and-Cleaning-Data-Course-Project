# Getting-and-Cleaning-Data-Course-Project

## Introduction 
This repository contains all the data of the project from the Coursera Course: Getting and Cleaning Data.

## Files
+ README.md: Brief summary of the repository
+ dataset_har_final.txt: Final dataset cleaned. 
+ CodeBook.md: Description of the dataset variables. 
+ run_analysis.R: R file with the code used to clean and create the final dataset.


## Analysis

### 1. Merge Train and test data
```R
>dataset_test <- data.frame(subject = subjects_test,  label = y_test)
>dataset_train <- data.frame(subject = subjects_train, label = y_train )
>
>dataset_final <- rbind(dataset_test, dataset_train)
>names(dataset_final) <- c("subject", "label")
>
>all_features <- rbind(X_test, X_train)
>names(all_features) <- features[,2]
```

### 2. Extract the measurement on the mean and standard deviation for each measurement.
I did it for all the mean and standard deviation variables
```R
>mean_id <- grep("mean",features$V2)
>std_id <- grep("std",features$V2)
```
### 3. Use descriptive activity names to name the activities in the data set
Creates an extra variable with the name corresponding to each label 
```R
>names(activities) <- c("label", "activity")
>activities$activity <- tolower(activities$activity)
>
>dataset_final <- merge(dataset_final, activities, by.x = 'label', by.y = 'label', all.x = TRUE)
```
### 4. Clear variable names
I did it along the whole analysis. Each time I added a new variable, I gave to it a clear and informative name in order to make the analysis more clean and easy to be followed.


### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using the aggregate function I computed the mean of each variable for each subject and activity

```R
>dataset_har_final <- aggregate(. ~ subject + label + activity, dataset_final, mean)
```
