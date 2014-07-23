run_analysis <- function() 
{
    # Read the feature names, and find the ones that measure mean or standard
    # deviation
    featureNames <- read.table("./features.txt", colClasses="character")
    colNames <- character()
    cols <- numeric()
    
    for (i in 1:nrow(featureNames))
    {
        featureName <- featureNames[i,2]
        
        if(length(grep("mean", featureName, fixed=TRUE)) > 0 ||
            length(grep("std", featureName, fixed=TRUE)) > 0)
        {
            colNames <- c(colNames, featureName)
            cols <- c(cols, i)
        }    
    }
    
    # Clean up feature names
    colNames <- gsub("()", "", colNames, fixed=TRUE)
    colNames <- gsub("-", "", colNames, fixed=TRUE)
    colNames <- gsub("mean", "Mean", colNames, fixed=TRUE)
    colNames <- gsub("std", "Std", colNames, fixed=TRUE)
    colNames <- gsub("BodyBody", "Body", colNames, fixed=TRUE)
    colNames <- gsub("tB", "timeB", colNames, fixed=TRUE)
    colNames <- gsub("tG", "timeG", colNames, fixed=TRUE)
    colNames <- gsub("fB", "freqB", colNames, fixed=TRUE)
    colNames <- gsub("fG", "freqG", colNames, fixed=TRUE)

    # Read in the activity names
    activityNames <- read.table("./activity_labels.txt", colClasses="character")
    
    # Read in the training files, extract mean and standard columns, and merge together
    xTrain <- read.table("./train/X_train.txt", colClasses="numeric", col.names=featureNames[,2])
    yTrain <- read.table("./train/Y_train.txt", colClasses="numeric", col.names="Activity")
    subjectTrain <- read.table("./train/subject_train.txt", colClasses="numeric", col.names="Subject")
    allTrain <- cbind(subjectTrain, yTrain, xTrain[cols])
    
    # Read in the test, extract mean and standard columns, and merge together
    xTest <- read.table("./test/X_test.txt", colClasses="numeric", col.names=featureNames[,2])
    yTest <- read.table("./test/Y_test.txt", colClasses="numeric", col.names="Activity")
    subjectTest <- read.table("./test/subject_test.txt", colClasses="numeric", col.names="Subject")
    allTest <- cbind(subjectTest, yTest, xTest[cols])
    
    # Merge training and test sets and replace activity IDs with activity names
    allData <- rbind(allTrain, allTest)
    allData$Activity <- activityNames[allData$Activity, 2]

    # Calculate means for all columns, grouped by subject-activity.
    summaryData <- aggregate(allData[,3:81], list(allData$Subject, allData$Activity), mean)
    write.table(summaryData, "SubjectActivityMeans.txt", row.names=FALSE, col.names=c("Subject", "Activity", colNames))
    
    colNames
}
