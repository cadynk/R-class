householdpowerconsumption <- read.table(file = paste(getwd(),"/household_power_consumption.txt",sep = ""),header = TRUE, sep = ";",colClasses = c("character","character","double", "double", "double", "double", "double", "double", "double"),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, nrows = 3000)
householdpowerconsumption2 <- subset(householdpowerconsumption, Date=="1/2/2007"|Date=="2/2/2007")

dates<- as.Date(x = householdpowerconsumption2$Date,format = "%d/%m/%Y")
datetime <- paste(dates, householdpowerconsumption2$Time)
householdpowerconsumption2$Datetime <- as.POSIXct(datetime)

plot(x = householdpowerconsumption2$Datetime,y = householdpowerconsumption2$Sub_metering_1, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)",col = "black")
lines(householdpowerconsumption2$Datetime,householdpowerconsumption2$Sub_metering_2,col = "red")
lines(householdpowerconsumption2$Datetime,householdpowerconsumption2$Sub_metering_3,col = "blue")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()