# Getting-and-Cleaning-Data
Course project 
### Prerequisite
The [experiment data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded.
The zipfile is extracted to a folder in the project directory called `UCI HAR Dataset'´
The R-script expects data from this directory structure

### Files
Readme.md  - This file
run_analysis.R - the script (Sorry, too many unnecessary lines of comments and trials, I fear) 
summary_data.txt - the resulting summary
CodeBook.md  

### Tidy Data
According to Hadley Wickham in his "Tidy Data" paper the main criteria are:

(1)Each variable forms a column   -- First I wanted to add a column test_or_train indicating the source of the observation. Later on I dropped this information. 
(Later i dropped them after I noticed that I had 2 columns x_test_or_train, y_test_or_train.  I was carfully using rbind
the train data first, the test data second. I wonder whats going wrong if I add  train+test for the x-data but test+train for the y-data files.  Due to lack of time....) 
(2)Each Observation forms a row  -- yes  I hope so-- I lost time verifying that dimensions fit, there no NAs .... 
(3)Each Type of Observational unit forms a table     ----  yes, fortunately I read the hint that Inertial data can be neglected for the purpose of the assignment.  And yes time-series are some special data I guess. 
