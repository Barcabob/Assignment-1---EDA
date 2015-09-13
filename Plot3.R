library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$DateTime <- paste(data$Date, data$Time) # merge date and time
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S") # change format of date time to date
data <- filter(data, DateTime >= "2007-02-01 00:00:00", DateTime < "2007-02-03 00:00:00")
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", pch = "---", col =c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()