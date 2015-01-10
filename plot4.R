#Reading data into R
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using data only from "1/2/2007","2/2/2007"
plotData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating plot4
datetime <- strptime(paste(plotData$Date, plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plotData$Global_active_power)
globalReactivePower <- as.numeric(plotData$Global_reactive_power)
voltage <- as.numeric(plotData$Voltage)
subMetering1 <- as.numeric(plotData$Sub_metering_1)
subMetering2 <- as.numeric(plotData$Sub_metering_2)
subMetering3 <- as.numeric(plotData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()