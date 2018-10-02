library(dplyr)
library(data.table)
library(lubridate)


#extract 2007 housing data
housing2007.data <- fread("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007"))

#plot 4
housing2007.data$Global_active_power <- as.numeric(housing2007.data$Global_active_power)
housing2007.data$timestamp <- paste(housing2007.data$Date, housing2007.data$Time)
housing2007.data$timestamp <- dmy_hms(housing2007.data$timestamp)
housing2007.data$Sub_metering_1 <- as.numeric(housing2007.data$Sub_metering_1)
housing2007.data$Sub_metering_2 <- as.numeric(housing2007.data$Sub_metering_2)
housing2007.data$Sub_metering_3 <- as.numeric(housing2007.data$Sub_metering_3)


png(filename = 'plot4.png', width = 480, height = 480)
par(mfcol=c(2,2))

#plot 1
hist(housing2007.data$Global_active_power, col = "red",  
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

#plot 2
plot(housing2007.data$timestamp, housing2007.data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(housing2007.data$timestamp, housing2007.data$Sub_metering_2, type = "l", col = "red")
lines(housing2007.data$timestamp, housing2007.data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.2)

#plot 3
plot(housing2007.data$timestamp, housing2007.data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#plot 4
plot(housing2007.data$timestamp, housing2007.data$Global_reactive_power, type = "l",
     xlab = "datatime", ylab = "Global_reactive_power")
dev.off()