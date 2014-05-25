X_test = read.table("./clean_data/UCI HAR Dataset/test/X_test.txt", sep ="")
sub_test = read.table("./clean_data/UCI HAR Dataset/test/subject_test.txt", sep="")
y_test = read.delim("./clean_data/UCI HAR Dataset/test/y_test.txt")
X_train = read.table("./clean_data/UCI HAR Dataset/train/X_train.txt", sep ="")
 sub_train = read.table("./clean_data/UCI HAR Dataset/train/subject_train.txt", sep="")
y_train = read.table("./clean_data/UCI HAR Dataset/train/y_train.txt", sep ="")
headers = read.table("./clean_data/UCI HAR Dataset/features.txt", sep="")


combine_X_train = cbind(sub_train, y_train, X_train)
combine_X = cbind(sub_test, y_test, X_test)
combine = rbind(combine_X, combine_X_train)


colnames(combine)[1] = "subject"
colnames(combine)[2] = "training"
header=as.character(headers[,2])
colnames(combine)[3:563] = header


std = combine[,grepl("std" , names(combine))]
avg = combine[,grepl("mean" , names(combine))]
new_combine = combine[,1:2]
new_combine = cbind(new_combine, avg, std)
colnames(new_combine) = gsub("[[:punct:]]", "", colnames(new_combine))


tidy_combine = new_combine[,1:2]
Body = new_combine[,grepl("tBodyAccmean" , names(new_combine))]
Body2 = new_combine[,grepl("tBodyAccstd" , names(new_combine))]
Gravity = new_combine[,grepl("tGravityAccmean" , names(new_combine))]
Gravity2 = new_combine[,grepl("tGravityAccstd" , names(new_combine))]
tidy_combine = cbind(tidy_combine,Body,Body2,Gravity,Gravity2)

tidy_combine2 = merge( activity, tidy_combine, by.y = "training" , by.x = "num", all=TRUE)