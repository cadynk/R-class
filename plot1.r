householdpowerconsumption <- read.table(file = paste(getwd(),"/household_power_consumption.txt",sep = ""),header = TRUE, sep = ";",colClasses = c("character","character","double", "double", "double", "double", "double", "double", "double"),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, nrows = 3000)
householdpowerconsumption2 <- subset(householdpowerconsumption, Date=="1/2/2007"|Date=="2/2/2007")

hist(x = householdpowerconsumption2$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()