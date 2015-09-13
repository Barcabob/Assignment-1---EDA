library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$DateTime <- paste(data$Date, data$Time) # merge date and time
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S") # change format of date time to date
data <- filter(data, DateTime >= "2007-02-01 00:00:00", DateTime < "2007-02-03 00:00:00")
hist(data$Global_active_power, freq = TRUE, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power",  ylim = c(0, 1200))
dev.copy(png, file = "plot1.png")
dev.off()



