## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:

The four R scripts create four example figures. The scripts retrieve the
datafile from the repository
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
and then uses the command unzip to create the text file
household_power_consumption.zip. The scripts use the command fread from the
library data.table to read only the lines for the dates February 1, 2007
and February 2, 2007. The variables Date and Time are archived as character
vectors and then converted to a Date class with the command strpline. The four
scripts plot1.R, plot2.R, plot3.R and plot4.R write the plots to 480x480
png files named plot1.png, plot2.png, plot3.png and plot4.png, respectively.
