library(dplyr)

setwd("C:/Users/peper/OneDrive/Documents/Coursera JHU Data Science Specialization/Exploratory Data Analysis/ExData_Plotting1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerconsumption.zip")
unzip("powerconsumption.zip")

power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE)
power.data <- filter(power.data, Date == "1/2/2007" | Date == "2/2/2007")

power.data$DateTime <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")
power.data <- power.data[,c(10,3:9)]

power.data$Global_active_power <- as.numeric(power.data$Global_active_power)

plot(power.data$DateTime, power.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()