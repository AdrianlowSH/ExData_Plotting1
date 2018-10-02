library(dplyr)
library(data.table)


#extract 2007 housing data
housing2007.data <- fread("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007"))

#plot 2
housing2007.data$timestamp <- paste(housing2007.data$Date, housing2007.data$Time)
housing2007.data$timestamp <- dmy_hms(housing2007.data$timestamp)
png(filename = 'plot2.png', width = 480, height = 480)
plot(housing2007.data$timestamp, housing2007.data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()