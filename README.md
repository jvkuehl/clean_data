

### Steps to importing and merging the test and training datasets.  More detail can be seen in the codebook for how I completed each step

1. Imported 6 files (X_test.txt, sub_test.txt, y_test.txt, X_train.txt, sub_train.txt, y_train.txt) using the read.table function
2. Combined all of the test data into one dataframe using cbind, combined all of the train data into one dataframe using cbind
 and combined the test and train data sets into one dataframe using rbind. 
3. Renamed the columns names with the original features description, 
4. Create a new dataframe with the subset of columns that match std and mean. 
5. Choose the variables for the tidy data set -  Here I choose to include these variables,  tBodyAcc-XYZ and tGravityAcc-XYZ because they are the raw signals captured from the experiments and all the other measurements reflected some kind of processing that I wasn't sure could be replicated with the information given.

