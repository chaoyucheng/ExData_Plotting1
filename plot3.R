library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",
                     sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                     eol = "\n", sep = ";")
library(datasets)
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, plot(strptime(paste(data$Date, data$Time), 
            "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type='l', xlab="",
            ylab="Energy sub metering"))
with(data, points(strptime(paste(data$Date, data$Time), 
            "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type='l', xlab="",
            ylab="Energy sub metering", col="red"))
with(data, points(strptime(paste(data$Date, data$Time), 
            "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type='l', xlab="",
            ylab="Energy sub metering", col="blue"))
legend("topright", lwd=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pt.cex = 1, cex=0.8, xjust=1)
dev.off()