## Let Rstudio to set working directory to the location of the file
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Download UCI data files from the web, unzip them, and specify time/date settings
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "data.zip"
if (!file.exists(destFile)){
    download.file(URL, destfile = destFile, mode='wb')
}
if (file.exists(destFile)){
    unzip(destFile)
}
dateDownloaded <- date()

## read data file
filename <- "household_power_consumption.txt"
power_consump <- read.table(filename, sep = ";", header = TRUE)

## sublet only part from 2007-02-01 and 2007-02-02.
power <- subset(power_consump, (power_consump[, 1] == "1/2/2007"
                                | power_consump[,1] == "2/2/2007"))

## change class of the 3rd to 9th columns to numeric
for (i in c(3:9)) {
    power[, i] <- as.numeric(power[, i])
}
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
power$DateTime <- as.POSIXct(power$DateTime)
power$weekdays <- weekdays(power$DateTime)

## read and pre-processing data into the "power" dataframe
source("read_data.R")
source("pre_processing_data.R")

## make the fourth plot
png(filename='plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

## top left plot
with(power, plot(DateTime, Global_active_power, type = 'l', xlab= "", 
                 ylab = "Global Active Power"))
## top right plot
with(power, plot(DateTime, Voltage, xlab = "datetime", type = 'l'))

## bottom left plot
with(power, plot(DateTime, Sub_metering_1, type = 'l', xlab = "", 
                 ylab = "Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col = 'red'))
with(power, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", lty = 1, col = c('black', 'red', 'blue'), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## bottom right plot
with(power, plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datetime'))
dev.off()

