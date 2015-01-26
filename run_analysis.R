#run_analsis.R code achieve the five steps:
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step1:
#Read the six files from the directory into Xtest,Ytest,Xtrain,Ytrain,Stest,and Strain.
Xtest<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
Xtrain<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
Stest<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
Strain<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

#Firstly column combined Strain,Ytrain,and Xtrain into a dataframe df1.
#Then column combined Stest,Ytest,and Xtest into a dataframe df2.
#Finally row combined df1 and df2 into a new dataframe df.

df1<-cbind(Strain,Ytrain,Xtrain)
df2<-cbind(Stest,Ytest,Xtest)
df<-rbind(df1,df2)
#Step1 is finished.

#Step2:
#Read the features variable names from features.txt
features<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Subset the 2nd coulmn and assign as character from factor
features2<-as.character(features[,2])

#Rename the column names of the dataframe(df) by defining the first two column
#names as subject and activity. And the 3rd to 563th column names are defined
#by features.
names(df)<-c("subject","activity",features2)

#There are dupilcated column names in columns303~344, 382~423, and 461~502,
#and rename them.
names(df)[303:344]<-c(303:344)
names(df)[382:423]<-c(382:423)
names(df)[461:502]<-c(461:502)

#Call library(dplyr)
#Check which colume names contain string "mean()","std()" and
#create a new dataframe(df_new) by selecting the column names containing "mean()","std()".
library(dplyr)
df_new<-select(df,subject,activity,contains("mean()"),contains("std()"))
#Step2 is finished.

#Step3:
#Uses descriptive activity names to name the activities in the data set
for (i in 1:10299){
  if(df_new[i,2]==1){
  df_new[i,2]="Walking"
 }
  if(df_new[i,2]==2){
  df_new[i,2]="Walking-upstairs"
 }
  if(df_new[i,2]==3){
  df_new[i,2]="Walking-downstairs"
 }
  if(df_new[i,2]==4){
  df_new[i,2]="Sitting"
 }
  if(df_new[i,2]==5){
  df_new[i,2]="Standing"
 }
  if(df_new[i,2]==6){
  df_new[i,2]="Laying"
 }
} 
#Step3 is finished.

#Step4:
#Change the dash in column names to period.
#Change the letters to lowercase.
names(df_new)<-tolower(names(df_new))
names(df_new)<-gsub("-",replacement=".",names(df_new))
#Step4 is finished.

#Step5:
#Use group_by function to group subject and activity.
#Use summarise_each function to calculate each mean of the variables.
df_new1<-group_by(df_new,subject,activity)
df_mean<-summarise_each(df_new1,funs(mean))

write.table(df_mean,file="./data/tidy_data_set.txt",row.name=FALSE)
#Step5 is finished.
#Obtained the tidy_data_set.txt





