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
with(power, plot(DateTime, Global_reactive_power, type = 'l'))

dev.off()

