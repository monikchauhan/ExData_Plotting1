#Reading data into R
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using data only from "1/2/2007","2/2/2007"
plotData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating plot2
datetime <- strptime(paste(plotData$Date, plotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plotData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()