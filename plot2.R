
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",
            sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
            eol = "\n", sep = ";")
library(datasets)
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(data, plot(strptime(paste(data$Date, data$Time), 
    "%d/%m/%Y %H:%M:%S"), Global_active_power, type='l', xlab="",
     ylab="Global Active Power (kilowatts)"))
dev.off()
