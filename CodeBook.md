
This document describes the code contained in run_analysis.R.

1. Read in the column names from the file (from the "features.txt" file)
2. We need to only read a subset of columns from the data file. To accomplish this I prepapre a vector of classNames that will be applied to the read. If the className is NULL then read.table function will skip that column. If the column is one that we want to read (mean or std)  I set the entry in the vecor to "double" if not its NULL
3. Read the data files applying the className vector above
4. Add the column names
5. Read the Activity Number and append that to the data set
6. Read the Subject Number and append that to the data set
7. Merge this data with the activity_labels.txt file data to get the string representation of the Activity Number
