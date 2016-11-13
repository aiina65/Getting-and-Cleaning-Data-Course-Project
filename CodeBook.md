# Har Dataset Code Book

## Code Book 
+ subject: id of the subject who took the study
+ label: numerical indicator of the activity
+ activity: categorical indicator of the activity 
+ Average value of mean and standard deviation of the following features: tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.


## Study Design
The resulting dataset, *dataset_har_final.txt*, has been created from The Human Activity Recognition Using Smartphones Dataset [1]. Final Data has been obtained using the R file: *run_analysis.R*.  

The resulting dataset consists of the average of all the mean and standard deviation variables grouped by subject and activity. 

Names have been chosen in order to keep the same format as in the original dataset. 



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
