OrignalData<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

filteredData <- OrignalData[OrignalData$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePowerData<-as.numeric(filteredData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePowerData, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()