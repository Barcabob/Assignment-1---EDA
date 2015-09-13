library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$DateTime <- paste(data$Date, data$Time) # merge date and time
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S") # change format of date time to date
data <- filter(data, DateTime >= "2007-02-01 00:00:00", DateTime < "2007-02-03 00:00:00")
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.copy(png, file = "plot2.png")
dev.off()