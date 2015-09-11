## Michael G. Farrell
## Exploratory Data Analysis - Project 1 / Plot 2
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

## Create line plot then save as local file in png format.
with(PowerDataSubset, plot(datetime, Global_active_power, type='n', ylab="Global Active Power (kilowatts)", xlab=""))
with(PowerDataSubset, lines(datetime, Global_active_power))
dev.copy(png, file = "./plot2.png",width=480,height=480)
dev.off()
