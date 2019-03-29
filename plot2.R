#getting the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

#converting the date variables to class using as.Date() function
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#obtaining data from 01-02-2007 to 02-02-2007 only
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting calender date and time variables into classes
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plotting global active power vs days
data$datetime <- as.POSIXct(data$datetime) #store number of seconds since origin
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#copying the plot and saving in png file of height and width=480
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)