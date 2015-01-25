
Xtest<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")

Xtrain<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")


df1<-cbind(Strain,Ytrain,Xtrain)
df2<-cbind(Stest,Ytest,Xtest)
df<-rbind(df1,df2)

features<-read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
features2<-features[,2]