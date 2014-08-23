##Download Electric power consumption dataset into your working directory
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA", "?"), stringsAsFactors=F)
data_subset <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

plot(data_subset$DateTime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()