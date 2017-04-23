# Get names of the features to use as column names
featurenames <- read.table('features.txt', FALSE, '')

# Read in the feature vectors for the test and train data sets, set the 
# column names per the features.txt file
xtest <- read.table('test/x_test.txt', FALSE, '', col.names=featurenames[,2])
xtrain <- read.table('train/x_train.txt', FALSE, '', col.names=featurenames[,2])

# Read in the activity id labels for the test and train data sets and call 
# the column 'activity_id'
ytest <- read.table('test/y_test.txt', FALSE, '', col.names=c('activity_id'))
ytrain <- read.table('train/y_train.txt', FALSE, '', col.names=c('activity_id'))

# Read in the subject id for each of the feature vectors in the test and 
# train data sets
subtest <- read.table('test/subject_test.txt', FALSE, '', col.names=c('subject_id'))
subtrain <- read.table('train/subject_train.txt', FALSE, '', col.names=c('subject_id'))

# Read in the activity labels by activity id from the activity_labels.txt file
actmap <- read.table('activity_labels.txt', col.names=c('activity_id', 'activity_desc'))

# Add the subject and activity id fields from the other files as columns in a single 
# dataframe for each of the test and train datasets
test_set <- cbind(xtest, ytest, subtest)
train_set <- cbind(xtrain, ytrain, subtrain)

# Combine the test and train datasets
combined_set <- rbind(test_set, train_set)

# Add the activity description as a column per the activity mapping, joining by activity_id.
combined_set <- merge(combined_set, actmap)
combined_set <- combined_set[-combined_set$activity_id]

# Create a list of columns that include mean or standard deviation
mean_std_featurenames <- colnames(combined_set)[grepl('mean', colnames(combined_set)) | grepl('std', colnames(combined_set))]
# Add in the other useful columns
mean_std_featurenames <- c(mean_std_featurenames, 'subject_id', 'activity_desc')
# Extract only the relevant columns per the assignment instructions
mean_std_cols_only <- combined_set[,which(colnames(combined_set) %in% mean_std_featurenames)]

# Group by the subject id and the activity id to create a single set of mean
# feature values for each activity/subject combination
means_by_subject_activity <- mean_std_cols_only %>%
    group_by(subject_id, activity_desc) %>%
    summarise_each(funs(mean(., na.rm = TRUE)))
