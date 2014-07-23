Course Project for Getting and Cleaning Data
============================================

This repo contains the solution files for the course project that is part of the "Getting and Cleaning Data" Coursera course.  The primary purpose of the project is to synthesize a tidy data set that summarizes a larger data set.  The larger data set, which is publically available, contains measurements of human activity.  The following files are part of this repo:
* run_analysis.R: an R script that creates a tidy data set consisting of the mean of each mean and standard deviation variable in the original data set.
* SubjectActivtyMeans.txt: the data set created by the R script above.  It contains a row for each subject/activity pair.
* CodeBook.md: a code book that desribes all of the variables in the SubjectActivityMeans.txt data set.

In order to reproduce the SubjectActivityMeans.txt data set, follow these steps:
1. Download the following file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip it.
3. Open the run_analysis.R script in R Studio or some other suitable R development environment.
4. In R Studio, set your working directory to "getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset", which should have been created when unziping the file from step 1.
5. Execute the run_analysis() function.
6. You should now have a SubjectActivityMeans.txt file in your working directory that is identical to the file in this repo.

