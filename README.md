# Getting-and-Cleaning-Data-Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. It is graded  peers on a series of yes/no questions related to the project. 
Included in this repo are: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) This README.md. This repo explains how all of the scripts work and how they are connected.

A full description is available at the site where the data was originally sourced from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It represents data collected from accelerometers from Samsung Galaxy S smartphones.
The source data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called run_analysis.R does the following to clean the data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Information from this README.md is from the Coursera Getting and Cleaning Data course website for the final project from week 4 and can be found at: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
