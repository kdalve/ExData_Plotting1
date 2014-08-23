##Download Electric power consumption dataset into your working directory
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA", "?"), stringsAsFactors=F)
data_subset <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_subset$DateTime,data_subset$Sub_metering_2, col="Red")
lines(data_subset$DateTime,data_subset$Sub_metering_3, col="Blue")
legend("topright",lty=1,lwd=1, col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()