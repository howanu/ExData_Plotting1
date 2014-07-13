# Created for course assignment 1 of Coursera's Exploratory Data Analysis Course
# URL: https://class.coursera.org/exdata-004/
#
# The following R script reads the data file required for course assignment 1.

# Purpose: Create a funtion to read data on electric powerconsumption from the
#     course website (attribution can be found at the URLs above)
# Returns: a dataframe representing consumption on Feb 1st and Feb 2nd of 2007,
#     with the following fields:

# 1. Date: Date in format dd/mm/yyyy 
# 2. Time: time in format hh:mm:ss 
# 3. Global_active_power: household global minute-averaged active power (in kilowatt) 
# 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
# 5. voltage: minute-averaged voltage (in volt) 
# 6. Global_intensity: household global minute-averaged current intensity (in ampere) 
# 7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
# 8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
# 9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
# 10. DateTime: The date and time in POSIXlt format (added by this function)
# Source: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption


readdata <- function() {

  ##
  ## Download, unzip, and read the data
  ##


  # The compressed zip archive
  zip_filename <- "household_power_consumption.zip"

  # The data file stored inside the compressed zip archive
  data_filename <- "household_power_consumption.txt"

  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                zip_filename)
  unzip(zip_filename)
  data <- read.csv(data_filename,
                   sep=";",
                   na.strings="?",
                   colClasses = c(
                     "character",          # Date
                     "character",          # Time
                     "numeric",            # Global_active_power
                     "numeric",            # Global_reactive_power
                     "numeric",            # Voltage
                     "numeric",            # Global_intensity
                     "numeric",            # Sub_metering_1
                     "numeric",            # Sub_metering_2
                     "numeric"             # Sub_metering_3
                   ))

  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

  ##
  ## Filter out all but 2007-02-01 and 2007-02-02
  ##
  days_after_d20070203 <- difftime(data$DateTime,
                                   strptime("01/02/2007", format="%d/%m/%Y"),
                                   units="days")

  data2Days <- data[!is.na(days_after_d20070203)
                    & days_after_d20070203>=0
                    & days_after_d20070203<2,]

}
