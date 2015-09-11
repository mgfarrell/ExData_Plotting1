## Michael G. Farrell
## Exploratory Data Analysis - Project 1 / Plot 1
## First step, load necessary libraries for script.
library(data.table)
library(lubridate)
library(dplyr)

## Read power consumption data into R then subset to Feb 1 & 2 2007.  Assumes file is in current 'data' directory.
PowerData <- read.table("./Data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "NA")
PowerDataSubset <- filter(PowerData, Date=="1/2/2007" | Date=="2/2/2007")

## Create histogram then save as local file in png format.
hist(as.numeric(as.character(PowerDataSubset$Global_active_power)),xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file = "./plot1.png",width=480,height=480)
dev.off()