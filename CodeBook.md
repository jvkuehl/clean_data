## This data comes from  the  Smartlab - Non Linear Complex Systems Laboratory from the data set Human Activity Recognition Using Smartphones Dataset Version 1.0.  Experiments were designed to measure activity in 6 activities using the Samsung Galaxy S II. 

### Transformations to the data

#### Read files into R 

* X_test = read.table("./clean_data/UCI HAR Dataset/test/X_test.txt", sep ="")
* sub_test = read.table("./clean_data/UCI HAR Dataset/test/subject_test.txt", sep="")
* y_test = read.delim("./clean_data/UCI HAR Dataset/test/y_test.txt")
* X_train = read.table("./clean_data/UCI HAR Dataset/train/X_train.txt", sep ="")
* sub_train = read.table("./clean_data/UCI HAR Dataset/train/subject_train.txt", sep="")
* y_train = read.table("./clean_data/UCI HAR Dataset/train/y_train.txt", sep ="")
* headers = read.table("./clean_data/UCI HAR Dataset/features.txt", sep="")

Verify the dimensions of the individual dataframes are correct.
> dim(X_test)
[1] 2947  561
>dim(y_test)
[1] 2947   1
> dim(sub_test)
[1] 2947    1

> dim(X_train)
[1] 7352  561
> dim(y_train)
[1] 7352    1
> dim(sub_train)
[1] 7352    1

#### Combine the files into one dataframe

* combine_X is the combined file of sub_test.txt, y_test.txt, and  X_test.txt 
* combine_X_train is the combined file of sub_train.txt, y_train.txt, and X_train.txt 
* combine is the combined the test and training sets into one dataframe 

> combine_X_train = cbind(sub_train, y_train, X_train)
> dim(combine_X_train)
[1] 7352  563

> combine_X = cbind(sub_test, y_test, X_test)
> dim(combine_X)
[1] 2947  563

>combine = rbind(combine_X, combine_X_train)



#### Rename the column names of the combine file

> colnames(combine)[1] = "subject"
> colnames(combine)[2] = "training"
> header=as.character(headers[,2])
> colnames(combine)[3:563] = header

#### Create a new dataframe with subject, training and only those headers that included mean or std in the title, remove punctuation in the colnames to conform to naming conventions.

>std = combine[,grepl("std" , names(combine))]
>avg = combine[,grepl("mean" , names(combine))]
>new_combine = combine[,1:2]
>new_combine = cbind(new_combine, avg, std)
> colnames(new_combine) = gsub("[[:punct:]]", "", colnames(new_combine))



#### Choose what variable to include in the tidy data set

> tidy_combine = new_combine[,1:2]
> Body = new_combine[,grepl("tBodyAccmean" , names(new_combine))]
> Body2 = new_combine[,grepl("tBodyAccstd" , names(new_combine))]
> Gravity = new_combine[,grepl("tGravityAccmean" , names(new_combine))]
> Gravity2 = new_combine[,grepl("tGravityAccstd" , names(new_combine))]
> tidy_combine = cbind(tidy_combine,Body,Body2,Gravity,Gravity2)


#### Use the descriptive names to names the activity in the dataset

tidy_combine2 = merge( activity, tidy_combine, by.y = "training" , by.x = "num", all=TRUE)



### Description of the variables

#####training 

######type of training 

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING
      

#####subject

######subject who performed the training between age of 19-48.

1 .subject #1

2 .subject #2

3 .subject #3

4 .subject #4

5 .subject #5

6 .subject #6

7 .subject #7

8 .subject #8

9 .subject #9

10 .subject #10

11 .subject #11

12 .subject #12

13 .subject #13

14 .subject #14

15 .subject #15

16 .subject #16

17 .subject #17

18 .subject #18

19 .subject #19

20 .subject #20

21 .subject #21

22 .subject #22

23 .subject #23

24 .subject #24

25 .subject #25

26 .subject #26

27 .subject #27

28 .subject #28

29 .subject #29

30 .subject #30
        
        

      
#####

######
        