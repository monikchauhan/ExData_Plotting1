#Reading data into R
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using data only from "1/2/2007","2/2/2007"
plotData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating plot1
globalActivePower <- as.numeric(plotData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()