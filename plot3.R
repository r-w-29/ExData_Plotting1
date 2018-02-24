OrignalData<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
OrignalData<-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

filteredData <- OrignalData[OrignalData$Date %in% c("1/2/2007","2/2/2007") ,]

subMeteringData1<-as.numeric(filteredData$Sub_metering_1)
subMeteringData2<-as.numeric(filteredData$Sub_metering_2)
subMeteringData3<-as.numeric(filteredData$Sub_metering_3)

formattedDateTime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(formattedDateTime, subMeteringData1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(formattedDateTime,subMeteringData2, type = "l", col="red")
lines(formattedDateTime,subMeteringData3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()