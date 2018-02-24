OrignalData<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

filteredData <- OrignalData[OrignalData$Date %in% c("1/2/2007","2/2/2007") ,]

subMeteringData1<-as.numeric(filteredData$Sub_metering_1)
subMeteringData2<-as.numeric(filteredData$Sub_metering_2)
subMeteringData3<-as.numeric(filteredData$Sub_metering_3)

formattedDateTime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalReactivePower <- as.numeric(filteredData$Global_reactive_power)

voltage <- as.numeric(filteredData$Voltage)

globalActivePower<-as.numeric(filteredData$Global_active_power)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))


plot(formattedDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(formattedDateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(formattedDateTime, subMeteringData1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(formattedDateTime,subMeteringData2, type = "l", col="red")
lines(formattedDateTime,subMeteringData3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=,lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(formattedDateTime, globalReactivePower, type="l", xlab="", ylab="Global Reactive Power")

dev.off()