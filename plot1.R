library(dplyr)
library(data.table)

#extract 2007 housing data
housing2007.data <- fread("household_power_consumption.txt") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007"))

#plot 1
housing2007.data$Global_active_power <- as.numeric(housing2007.data$Global_active_power)
png(filename = 'plot1.png', width = 480, height = 480)
hist(housing2007.data$Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts")
dev.off()