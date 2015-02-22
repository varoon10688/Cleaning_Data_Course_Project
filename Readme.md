---
title: "Readme"
author: "Varoon"
date: "Sunday, February 22, 2015"
---

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

*  A tidy.txt file containing tidy data set. The data set contains mean measured variables (listed in codebook)for all the activities and subjects
*  Codebook.md file explains all the activities and variables listed in the tidy file
*  run_analysis.R code file that cleans the untidy data set from 
   
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The tidy data set follows the princples used by 



### Working of tidy.R code
*  The code reads both the test and train set of data
*  Individual Y_trains and X_trains are column binded with their subjects
*  Once each train and test set of data are prepared with their subjects and activities, they are row binded together
*  The row binded data contains only activity index and not the names
*  Merge tool is used to combine the activity index and the activity names found in features.txt data
*  This is final merged data containing the activity names and variables measured variables
*  The list of varibles in this set of data is too large and only varibles containing the name "mean" and "std" are  chosen from this set of data
*  The chosen variables are melted to a new data set for reordering
* The final tidy data set is reordered based subjects and activity names with mean of the chosen variables

### Reading the tidy.txt file in R
* Save the file locally in your working directory
* tidy_data_loaded <- read.table("tidy.txt", header=TRUE)