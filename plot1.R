
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",
            sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
            eol = "\n", sep = ";")
library(datasets)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()