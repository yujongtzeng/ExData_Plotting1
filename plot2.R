## read and pre-processing data into the "power" dataframe
source("read_data.R")
source("pre_processing_data.R")

## make the second plot
png(filename='plot2.png', width = 480, height = 480)
plot( as.POSIXct(power$DateTime), power$Global_active_power, type = 'l', xlab = "", 
     ylab = "Global Active Power (killowatts)")
dev.off()

