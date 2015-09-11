## Michael G. Farrell
## Exploratory Data Analysis - Project 1 / Plot 4
## First step, load necessary libraries for script.
library(data.table)
library(lubridate)
library(dplyr)

## Read power consumption data into R then subset to Feb 1 & 2 2007.  Assumes file is in current 'data' directory.
PowerData <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "NA")
PowerDataSubset <- filter(PowerData, Date=="1/2/2007" | Date=="2/2/2007")

## Add new variable/column in datetime format which will be needed for the X-axis of the plot.
PowerDataSubset <- tbl_df(PowerDataSubset) %>%
  mutate(datetime = dmy_hms(paste(Date,Time)))

## Create multiple plots on four panels.  Save in png format.
png(filename = "./plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
with(PowerDataSubset, {
  plot(datetime, Global_active_power, type='n', ylab="Global Active Power", xlab="")
  lines(datetime, Global_active_power)
  plot(datetime, Voltage, type='n', ylab="Voltage")
  lines(datetime, Voltage)
  plot(datetime, Sub_metering_1, type='n', ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_1, col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex=0.7)
  plot(datetime, Global_reactive_power, type='n') 
  lines(datetime, Global_reactive_power)})
dev.off()
