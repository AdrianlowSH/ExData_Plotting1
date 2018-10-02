library(dplyr)
library(data.table)


#extract 2007 housing data
housing2007.data <- fread("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007"))

#plot 3
housing2007.data$timestamp <- paste(housing2007.data$Date, housing2007.data$Time)
housing2007.data$timestamp <- dmy_hms(housing2007.data$timestamp)
housing2007.data$Sub_metering_1 <- as.numeric(housing2007.data$Sub_metering_1)
housing2007.data$Sub_metering_2 <- as.numeric(housing2007.data$Sub_metering_2)
housing2007.data$Sub_metering_3 <- as.numeric(housing2007.data$Sub_metering_3)

png(filename = 'plot3.png', width = 480, height = 480)
plot(housing2007.data$timestamp, housing2007.data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(housing2007.data$timestamp, housing2007.data$Sub_metering_2, type = "l", col = "red")
lines(housing2007.data$timestamp, housing2007.data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()