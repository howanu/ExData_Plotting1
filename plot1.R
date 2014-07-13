# Created for course assignment 1 of Coursera's Exploratory Data Analysis Course
# URL: https://class.coursera.org/exdata-004/ 
#
# The following R script is meant to reproduce plot1.png as it was created by
# Roger D. Peng of Johns Hopkins. It is displayed by the README.md at this URL:
# https://github.com/howanu/ExData_Plotting1

##
## Download, unzip, read, and filter the data if necessary
##

if (!exists("obs")) {
  source("readdata.R")
  obs <- readdata()
}

##
## Create the plot
##
isSubPlot = length(dev.list() > 0)

if (!isSubPlot) {
  png("plot1.png")
}

hist(obs$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
     )

if (!isSubPlot) {
  dev.off()
}
