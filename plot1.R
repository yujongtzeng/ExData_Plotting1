## read and pre-processing data into the "power" dataframe
source("read_data.R")
source("pre_processing_data.R")

## make the first plot
png(filename='plot1.png', width = 480, height = 480)
hist(power[, 3], col = 'red', main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)")
dev.off()
