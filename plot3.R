#getting the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

#converting the date variables to class using as.Date() function
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#obtaining data from 01-02-2007 to 02-02-2007 only
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting calender date and time variables into classes
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plotting energy sub metering vs days
data$datetime <- as.POSIXct(data$datetime) #store number of seconds since origin
attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copying the plot and saving in png file of height and width=480
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)
