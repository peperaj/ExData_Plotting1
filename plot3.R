library(dplyr)

setwd("C:/Users/peper/OneDrive/Documents/Coursera JHU Data Science Specialization/Exploratory Data Analysis/ExData_Plotting1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerconsumption.zip")
unzip("powerconsumption.zip")

power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE)
power.data <- filter(power.data, Date == "1/2/2007" | Date == "2/2/2007")

power.data$DateTime <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")
power.data <- power.data[,c(10,3:9)]

power.data$Sub_metering_1 <- as.numeric(power.data$Sub_metering_1)
power.data$Sub_metering_2 <- as.numeric(power.data$Sub_metering_2)
power.data$Sub_metering_3 <- as.numeric(power.data$Sub_metering_3)

plot(power.data$DateTime, power.data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power.data$DateTime, power.data$Sub_metering_2, type = "l", col = "red")
lines(power.data$DateTime, power.data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()