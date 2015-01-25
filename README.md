# Getting-and-Cleaning-Data-Project-repo
This repo contains README.md, Codebook.md, and run_analysis.R, to finish the "Getting and Cleaning
Data" coursera project.

run_analysis.R includes the codes to achieve the tidy data set, that followed by the five descriptive steps below.

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Codebook.md describes the variables used in the dataset. The variables are subject, activity, and 561 features.
 
The codes in run_analysis.R firstly combine the following six individual file to one dataframe(df) contained 10229 rows (observations) and 563 columns (variables):
(1)'train/X_train.txt': Training set.
(2)'train/y_train.txt': Training labels.
(3)'test/X_test.txt': Test set.
(4)'test/y_test.txt': Test labels.
(5)'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
(6)'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Then change the variable names of the first two columns as subject and activity, respectively, and
change the 3rd to 563th variable names defined by the file: features.txt.
I found there are dupilcated column names in columns303~344, 382~423, and 461~502, and caused that select function can't be used.
Because these columns are not mean or std, these column names are changed to 303~344, 382~423, and 461~502. 
#Step1 is finished.

Then extract the dataframe (df) of variable names containing mean and standard deviation into a new dataframe (df_new) by select function.
The df_new dim is 10299*68, and that means there are 66 columns containing mean or std.
#Step2 is finished.

Then use if function to change the activities (numeric 1~6) in the data set by descriptive activity names ("Walking","Walking-upstairs"
,"Walking-downstairs","Sitting","Standing", and"Laying"
#Step3 is finished.

Then change the dash in variables (column names) to period and change the letters of variables to lowercase.
#Step4 is finished.

Then use group_by function to group subject and activity, and calculate the means of each variables (total 66 means).
Finally, use write.table function to output the tidy_data_set.txt
#Step5 is finished.





