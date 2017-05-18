# Getting-and-Cleaning-Data-Course-Project
 Getting and Cleaning Data Course Project  
 
 This repo contains my work for the Getting and Cleaning Data Course Project
 
 It contans a script called run_analysis.R that will
 * Extract data from files for test and train data
 * Merge that data into a singe data set
 * Add the Activity description and the Subject number
 
 The CodeBook.md explains it more detailed.

 There is also a file named tidy_mean.csv that can be read into R with the following command.
 
 f <- read.table(file = "tidy_mean.csv", sep = ",")
