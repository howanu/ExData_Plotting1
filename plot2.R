# Created for course assignment 1 of Coursera's Exploratory Data Analysis Course
# URL: https://class.coursera.org/exdata-004/ 
#
# The following R script is meant to reproduce plot2.png as it was created by
# Roger D. Peng of Johns Hopkins. It is displayed by the README.md at this URL:
# https://github.com/howanu/ExData_Plotting1

##
## Download, unzip, read, and filter the data
##

source("readdata.R")
obs <- readdata()

##
## Create the plot
##
png("plot2.png")
plot(obs$Global_active_power, 
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt='n'
     )
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()
