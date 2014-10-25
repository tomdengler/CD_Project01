##CD_Project01

###Coursera Getting and Cleaning Data - Project 1

##Info

Source file `run_analysis.R` contains a `run()` function which creates the `tidy.txt` file required by the project.  This function assumes the data has been previously downloaded and unzipped into the subfolder 
`.\rawdata` 
which should be located under the location of the source file.  The run() function reads the data in the test and trial raw data subfolders, creates the appropriate data.frames, assigns nice column names, summarizes the averages of the data by subject and activity, and then creates the output file.

The assignment requests that only the mean and standard deviation statistics of the raw data be included in the result.  I interperted this include only those columns with `mean()` and `std()` which results in 66 columns of data.


In reviewing the data I made the following observation and performed the following procedures:

- x_test.txt has 561 values columns per row which correspond to 561 rows in features.txt for variable names
- there are 2947 rows in each of the following:
 - test\subject.txt (maps to a person)
 - test\y_test.txt 1 column with values 1-6 maps to 6 rows in activity_labels.txt
 - test\x_test.txt 561 columns where each column maps to a row in features.txt
 - the above three files, after filtering columns, are column combined into a single data.frame with the activity id replaced by the activity label.
- 7352 rows in each of the train files with similar structure and procedure
- The resulting test and train data sets are combined and then summarized into a single file by subject and activity. 
- There are 30 volunteers, each doing 6 activities; therefore the resulting tidy set should have 30 * 6 rows = 180 rows

Please review the codebook.md file for details about the resulting data structure.



Note:
- the subfolder files (body_acc,body_gyro,total_acc,...) each have 128 values per row, however this data is not being included in the analysis
 - each file also contains 2947 rows
 - these subfolder files are not being used


