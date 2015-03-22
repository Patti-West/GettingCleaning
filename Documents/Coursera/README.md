============================================================
This README.md file contains instructions and information on the run_analysis.R script and Fit_summary.txt files.
These files were created for the course project for Getting and Cleaning Data.
============================================================
AUTHOR: Patti West
Date: March 21, 2015
============================================================

Data for this project were originally sourced from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

============================================================
The source data contained in pieces the statistics of 30 subjects who participated
in various levels of activity (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Lying Down.)
The script run_analysis.R completes several tasks:

First, it reads in the source data components, both training and test datasets.
It combines the observation fields with the subject data and the activity data.
It combines training and test into one field.
It appends a description to the activity index so it is more descriptive.
It subsets the source data to only include columns that derived a mean or standard deviation.
(This still results in almost 80 fields of variables that contain the readings from the smartphone for each subject.)
Finally, the script writes a file, Fit_summary.txt, that aggregates the data to give the average of each mean and std dev measure in the subset dataset.
============================================================
Fit_summary is a tidy dataset that summarizes the original source data.
It contains 180 observations, 30 subjects with 6 activities each, with averages of many of the fields in the source data.
Every variable in the source dataset that gave a mean or standard deviation were included in Fit_summary.
============================================================ 