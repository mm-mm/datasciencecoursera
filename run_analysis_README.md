## run_analysis_README.txt
==================================================================
Analysis of Data:  Human Activity Recognition Using Smartphones Dataset
run_analyis.R
==================================================================
M.Mueller
Silicon Valley, California
github:  mm-mm/datasciencecoursera
==================================================================

## Summary
	run_analysis.R reads in UCI HAR Dataset data.  The data from separate files is merged into one large
	dataframe object.  From this object, only those data relating to means and std (standard deviations) 
	of measurements are kept.  The means of these columns are separately computed for each combination of
	subject and activity.  The output table contains textual (not numeric) descriptions of activities.


## run_analysis.R performs the following:
	1)  Reads in data from the UCI HAR Dataset (folder downloaded into the working directory).
		The UCI HAR Dataset folder (and sub-folders/files) can be downloaded from
		   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
		A detailed description of the dataset can be obtained from:
		   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	2)  Merges the training and the test sets to create one data set.  The merged data set also includes
		subject and activity data, as well as column names from the features file.
	3)  Extracts only the measurements on the mean and standard deviation for each measurement. 
		Note:  The extracted measurements correspond to "-mean()" and "std()".  There are other
		column names describing mean frequencies  with "meanFreq()", but there are no corresponding 
		standard deviations for these column names, thus the "meanFreq()" variables are not extracted.
		Similarly, there are column names describing an angle between one vector and a mean of 
		another vector, and these columns are also not extracted.  In summary, we keep those 
		columns whose descriptions include "-mean()" and "std()".
	4)  Uses descriptive activity names to name the activities in the data set.  Activity names are 
		read from the activities.txt file.  The activity descriptions are used instead of activity
		numbers (1 through 6).
	5)  Appropriately labels the data set with descriptive variable names. Column names for the data frames
		are derived from data in the features.txt within the UCI_HAR_Dataset folder.
	6)  From the data set in step 4, creates a second, independent tidy data set with the average of 
		each variable for each activity and each subject.  Note:  this dataframe has 66 columns of data 
		(wide) in addition to the two other columns which represent Subject and Activity.  The data table,
		between the Subject and Activity columns (which function as row names) and the column names, are
		values which represent the mean of the data as described by the column name for each combination 
		of Subject and Activity.    There are 180 rows of data (6 activities x 30 subjects) and 66 columns of
		data.

	Running run_analysis.R requires installing the package "plyr".

	run_analysis.R produces a data file named "run_analysis_output.txt".  To read this file in R into 
	dataframe object df,  
		> df <- read.table("run_analysis_output.txt",header=TRUE)

	 There are 180 rows of data (6 activities x 30 subjects) and 66 columns.  The numerical values in the table,
		between the Subject and Activity columns (which function as row names) and the column names, are
		values which represent the mean of the data as described by the column name for each combination 
		of Subject and Activity. 




Original Data Description:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit� degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
