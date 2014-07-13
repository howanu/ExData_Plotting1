# Created for course assignment 1 of Coursera's Exploratory Data Analysis Course
# URL: https://class.coursera.org/exdata-004/ 
#
# The following R script is meant to reproduce plot3.png as it was created by
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
## Create the plots
##

png("plot4.png")

par(mfcol = c(2, 2))
source("plot2.R")
source("plot3.R")

##
## Plot the top right Voltage plot
##

plot(obs$Voltage, 
     type="l",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt='n'
     )
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

##
## Plot the bottom right Global Reactive Power plot
##

plot(obs$Global_reactive_power, 
     type="l",
     ylab = "Global_reactive_power", # Note we need underscores rather than spaces
     xlab = "datetime",
     xaxt='n'
)
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


dev.off()


