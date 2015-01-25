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
#
df_new1<-group_by(df_new,subject,activity)
names(df_new1)[3:68]<-names(Xtest)[1:66]
df_mean<-summarize(df_new1,mean1=mean(V1),mean2=mean(V2),mean3=mean(V3),
 mean4=mean(V4),mean5=mean(V5),mean6=mean(V6),mean7=mean(V7),
 mean8=mean(V8),mean9=mean(V9),mean10=mean(V10),
 mean11=mean(V11),mean12=mean(V12),mean13=mean(V13),
 mean14=mean(V14),mean15=mean(V15),mean16=mean(V16),mean17=mean(V17),
 mean18=mean(V18),mean19=mean(V19),mean20=mean(V20),
 mean21=mean(V21),mean22=mean(V22),mean23=mean(V23),
 mean24=mean(V24),mean25=mean(V25),mean26=mean(V26),mean27=mean(V27),
 mean28=mean(V28),mean29=mean(V29),mean30=mean(V30),
 mean31=mean(V31),mean32=mean(V32),mean33=mean(V33),
 mean34=mean(V34),mean35=mean(V35),mean36=mean(V36),mean37=mean(V37),
 mean38=mean(V38),mean39=mean(V39),mean40=mean(V40),
 mean41=mean(V41),mean42=mean(V42),mean43=mean(V43),
 mean44=mean(V44),mean45=mean(V45),mean46=mean(V46),mean47=mean(V47),
 mean48=mean(V48),mean49=mean(V49),mean50=mean(V50),
 mean51=mean(V51),mean52=mean(V52),mean53=mean(V53),
 mean54=mean(V54),mean55=mean(V55),mean56=mean(V56),mean57=mean(V57),
 mean58=mean(V58),mean59=mean(V59),mean60=mean(V60),
 mean61=mean(V61),mean62=mean(V62),mean63=mean(V63),
 mean64=mean(V64),mean65=mean(V65),mean66=mean(V66))

write.table(df_mean,file="./data/tidy_data_set.txt",row.name=FALSE)
#Step5 is finished.
#Obtained the tidy_data_set.txt





