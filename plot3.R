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
## Create the plot
##

isSubPlot = length(dev.list() > 0)

if (!isSubPlot) {
  png("plot3.png")
}

plot(obs$Sub_metering_1, 
     type="l",
     ylab = "Energy sub metering",
     xlab = "",
     xaxt='n'
     )
axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
lines(obs$Sub_metering_2, col="red")
lines(obs$Sub_metering_3, col="blue")

#
# The multiple plot does notuse a border around the legend
#
if (isSubPlot) {
  bty_var <- "n"
} else {
  bty_var <- "o"
}

legend("topright", 
       lty=1,
       col = c("black","red","blue"), 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      bty=bty_var)

if (!isSubPlot) {
  dev.off()
}

