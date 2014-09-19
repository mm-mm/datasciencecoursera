## run_analysis codebook

run_analysis.R performs the following:

	1)  Reads in data from the UCI HAR Dataset (folder downloaded into the working directory).
		The UCI HAR Dataset folder (and sub-folders/files) can be downloaded from
		   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
		A detailed description of the dataset can be obtained from:
		   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

		Separate files are each read in to the following dataframe objects:  
			x_train_df        dim=7352x561
			y_train_df        dim=7352x1
			subj_train_df     dim=7352x1
			x_test_df         dim=2947x561
			y_test_df         dim=2947x1
			subj_test_df      dim=2947x1
			features_df	  dim=561x2
			activity_labels_df dim=6x2
			

	2)  Merges the training and the test sets to create one data set.  The merged data set also includes
		subject and activity data, as well as column names from the features file.

		train_df is formed by column-binding x_train_df, subj_train_df, and y_train_df
		test_df is formed by column-binding x_test_df, subj_test_df, and y_test_df

		uci_har_df is formed by row-binding train_df and test_df, so the resulting dataframe
			has dimensions 10299x563.  The features_df data is used to form the column names
			of uci_har_df.
			
	3)  Extracts only the measurements on the mean and standard deviation for each measurement. 

		Note:  The extracted measurements correspond to "-mean()" and "std()".  There are other
		column names describing mean frequencies  with "meanFreq()", but there are no corresponding 
		standard deviations for these column names, thus the "meanFreq()" variables are not extracted.
		Similarly, there are column names describing an angle between one vector and a mean of 
		another vector, and these columns are also not extracted.  In summary, we keep those 
		columns whose descriptions include "-mean()" and "std()".

		df_mean_std is formed by choosing only those columns corresponding to 
		"-mean()" and "-std()".  The Subject and Activity columns are also included.  The resulting
		df_mean_std data has 66 columns.

	4)  Uses descriptive activity names to name the activities in the data set.  Activity names are 
		read from the activities.txt file.  The activity descriptions are used instead of activity
		numbers (1 through 6).

		df_mean_std2 is formed by joining df_mean_std with activity_df.  This creates an extra, 
		repetitive column since the numeric activity column and the new text activity column
		both describe the same activity.  In order to keep the data set tidy, the numeric activity
		data column is deleted.

	5)  Appropriately labels the data set with descriptive variable names. Column names for the data frames
		are derived from data in the features.txt within the UCI_HAR_Dataset folder.

		The features_df information was already 'merged' into the uci_har_df dataframe as column names, 
		thus the labels with descriptive variable names are already in place.

	6)  From the data set in step 4, creates a second, independent tidy data set with the average of 
		each variable for each activity and each subject.  Note:  this dataframe has 66 columns of data 
		(wide) in addition to the two other columns which represent Subject and Activity.  The data table,
		between the Subject and Activity columns (which function as row names) and the column names, are
		values which represent the mean of the data as described by the column name for each combination 
		of Subject and Activity.    There are 180 rows of data. 

		The computed data is placed into df_averages, which contains 180 rows of data 
		(6 activities x 30 subjects) and 66 columns of	data, plus two columns which function as
		row-names (containing the Subject and Activity information for each row).

	Running run_analysis.R requires installing the package "plyr".

	7)  run_analysis.R produces a data file named "run_analysis_output.txt" in the working directory.  
		To read this file in R into a dataframe object df,  
		> df <- read.table("run_analysis_output.txt",header=TRUE)

	 	There are 180 rows of data (6 activities x 30 subjects) and 66 columns plus the two
		Subject and Activity columns which function as row names, for a total of 68 columns.
		The numerical table values each represent the mean of the data as described by the column 
		name for each combination of Subject and Activity.  Thus, dim(df) is 180x68 (66+2).  
		If the object is read without a header, the column names are read as a separate row.
