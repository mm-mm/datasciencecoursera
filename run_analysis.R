#  run_analysis.R
#  Coursera/Johns Hopkins course Getting and Cleaning Data
#  Course Project

#Written for R 3.1.1


# user must install plyr... or uncomment the next line and run...
#install.packages("plyr")
library(plyr)

# read files into dataframes (then combine)
x_train_df <- read.table('UCI HAR Dataset/train/X_train.txt') #dim=7352x561
y_train_df <- read.table('UCI HAR Dataset/train/y_train.txt') #dim=7352x1
subj_train_df <- read.table('UCI HAR Dataset/train/subject_train.txt') #dim=7352x1

x_test_df <- read.table('UCI HAR Dataset/test/X_test.txt')    #dim=2947x561
y_test_df <- read.table('UCI HAR Dataset/test/y_test.txt')    #dim=2947x1
subj_test_df <- read.table('UCI HAR Dataset/test/subject_test.txt')    #dim=2947x1

activity_labels_df <- read.table('UCI HAR Dataset/activity_labels.txt')    #dim=6x2
features_df <- read.table('UCI HAR Dataset/features.txt')    #dim=561x2

#features_info.txt explains the measurements, including mean() and std() which are of
#interest in this work.

# combine into one df
#first create train_df, then test_df, then combine those into ucihar_df, then add
#names to columns
train_df <- cbind(x_train_df,subj_train_df,y_train_df)  #dim=7352x563
test_df <- cbind(x_test_df,subj_test_df,y_test_df)      #dim=2947x563
uci_har_df <- rbind(train_df,test_df)
#NOTE:  uci_har_df IS THE REQUESTED DATAFRAME FOR STEP 1 in the Coursera project instructions
#note regarding data cleanliness:  any(is.na(uci_har_df)) FALSE, 
# therefore no missing values

names <- as.character(features_df$V2)
#changes factor in df into a vector of character strings, so that std and avg columns can be extracted
 

colnames(uci_har_df) <- names
#provides description of measurements
colnames(uci_har_df)[562] <- 'Subject'
colnames(uci_har_df)[563] <- 'ActivityNum'
#add on subject and y (activity)  names

# filter out the measurement descriptions which include '-mean' and '-std', excluding
# Mean with capital M since the latter describe angles between a mean and something else.
# Thus meanFreq() is also excluded, since there is no corresponding std, thus
# being consistent with the requested data analysis (mean and std of measurements).
boolnames <- (grepl('-mean',names)&!grepl('-meanFreq',names))|grepl('-std',names)
# Also include Subject and Activity columns
boolnames[562] <- TRUE
boolnames[563] <- TRUE
df_mean_std <- uci_har_df[,boolnames]
# 68 columns in df_mean_std
#NOTE:  df_mean_std CONTAINS ONLY THE DATA AS REQUESTED IN STEP 2 of the Coursera project instructions
#NOTE:  df_mean_std INCLUDES DESCRIPTIVE VARIABLE NAMES AS REQUESTED IN STEP 4 of the Coursera project instructions

# change activity factors (1-6) into activity descriptions
# first: establish colnames of activity_labels_df for joining using ActivityNum
colnames(activity_labels_df) <- c("ActivityNum","ActivityName")
# second:  join df_mean_std with activity_labels_df (ActivityNum is col with common name)
df_mean_std <- join(df_mean_std,activity_labels_df)
# df_mean_std now has a new column, so 69 columns total.
# delete column "ActivityNum", or column 68, this is not needed.

df_mean_std2 <- df_mean_std[,1:67]
df_mean_std2[,68] <- df_mean_std[,69]
colnames(df_mean_std2)[67] <- "Subject"
colnames(df_mean_std2)[68] <- "Activity"
#done... cols 1-66 are means and stds, 67 is subject (integer), and 68 is activity(char)
#NOTE:  df_mean_std2 IS THE REQESTED TIDY DATAFRAME FOR STEP 4 of the Coursera project instructions
#  (the numerical activity column is deleted so that there is only one column for this parameter, 
#   not two, thus it's tidy).

#produce the dataframe of means for each combination of subject and activity, then make sure
# all labels are descriptive
df_averages <- aggregate(df_mean_std2[1:66],list(df_mean_std2[,67],df_mean_std2[,68]),FUN=mean)
colnames(df_averages)[1] <- "Subject"
colnames(df_averages)[2] <- "Activity"
#NOTE: df_averages IS THE REQUESTED TIDY DATAFRAME FOR STEP 5 of the Coursera project

filename <- "run_analysis_output.txt"
write.table(df_averages,filename,row.name=FALSE)

# to read the table, use into a dataframe df:  df <- read.table(filename,header=TRUE)

