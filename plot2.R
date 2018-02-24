OrignalData<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

filteredData <- OrignalData[OrignalData$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePowerData<-as.numeric(filteredData$Global_active_power)
formattedDateTime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(formattedDateTime, globalActivePowerData, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()