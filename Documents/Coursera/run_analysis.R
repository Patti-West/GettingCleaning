#
if( !file.exists("UCI HAR Dataset")){stop}
#
# read in source tables 
#
# X_train and X_test have the recorded data points for 70% of observations
X_train <- read.table("~/Coursera/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("~/Coursera/UCI HAR Dataset/test/X_test.txt", quote="\"")
#
# y_train and y_test give the activity number for each observation
y_train <- read.table("~/Coursera/UCI HAR Dataset/train/y_train.txt", quote="\"")
y_test <- read.table("~/Coursera/UCI HAR Dataset/test/y_test.txt", quote="\"")
#
# features gives the variable names that are used to label the columns in X_train and X_test
features <- read.table("~/Coursera/UCI HAR Dataset/features.txt", quote="\"")
# subject files give the subject for each observation
subject_train <- read.table("~/Coursera/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("~/Coursera/UCI HAR Dataset/test/subject_test.txt", quote="\"")
#
# add the subject and activity values to the master data sets.
X_train$subject <-subject_train$V1
X_test$subject <-subject_test$V1
#
X_train$activity <- y_train$V1
X_test$activity <- y_test$V1
#
# get the column names right
names(X_test) <- features$V2
names(X_test)[562] <- "subject"
names(X_test)[563] <- "activity"
names(X_train) <- features$V2
names(X_train)[562] <- "subject"
names(X_train)[563] <- "activity"
#
#Need to fix the activity to not show a number 
# now merge the training and testing to get the full set
#
X_total <-rbind(X_train, X_test)
#
# read in activity labels 
activity_labels <- read.table("~/Coursera/UCI HAR Dataset/activity_labels.txt", quote="\"")
#
#
X_total$activity_label <- activity_labels$V2[match(X_total$activity,activity_labels$V1)]
# 
# Subset out the columns with mean and std dev
#
Fit_Final <- subset(X_total,select = c(562,564,1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552))
#
# Use aggregate to make the second tidy dataset.
Fit_summary <-aggregate(Fit_Final, by=list(Fit_Final$subject,Fit_Final$activity_label),FUN=mean)
#
# Write Fit_summary to a txt file
write.table(Fit_summary,file = "Fit_summary.txt", append = FALSE,quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)
