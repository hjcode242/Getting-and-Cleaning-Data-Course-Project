## Getting and Cleaning Data - peer assessment project

## The original data was transformed by
1. Creating a single data set by merging training and the test sets
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4.  Labeling the data set appropriately
5. Creating a second tidy data set. 

## About R script

The 5 predominant steps to run_analysis.R to process the raw data sets and create the tidy data set.

         Step 1: Install necessary packages "dplyr" "data.table".
                 Ensure the installation of these packages before to performing
                  any processes.      
                  
         Step 2: Merge the training and the test data sets (X, Y and subject) to create a single data set using 
              the "rbind" function.
            
         Setp 3: Use the "grep" function "-mean\\(\\)|-std\\(\\)" to extract the SD and mean for each measurement.
            
               
         Step 4: Use descriptive names to name the activities in the data set produced a 
                 one-column data frame called "x_data" containing descriptive activity names.

            
         Step-5: Create a tidy data set with the average of each variable for each activity and each subject.
                          
              The file called "tidydataset.txt" was created via "write.table" function.
                This is the final output tidy processed data.
              
