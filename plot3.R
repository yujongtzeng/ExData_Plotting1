## read and pre-processing data into the "power" dataframe
source("read_data.R")
source("pre_processing_data.R")


## make the third plot
png(filename='plot3.png', width = 480, height = 480)
with(power, plot(DateTime, Sub_metering_1, type = 'l', xlab = "", 
                 ylab = "Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col = 'red'))
with(power, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", lty = 1, col = c('black', 'red', 'blue'), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

