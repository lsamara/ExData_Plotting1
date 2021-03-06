# plot3<- function() {
pd<- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

# Merge Time and Date
MergedTimeDate<- strptime(paste(pd$Date, pd$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pd<-cbind(pd, MergedTimeDate)

pd$Date <- as.Date(pd$Date, format="%d/%m/%Y")
pd$Time<- format(pd$Time, format="H:%M:%S")
pd$Global_active_power<- as.numeric(pd$Global_active_power)
pd$Global_reactive_power<- as.numeric(pd$Global_reactive_power)
pd$Voltage<- as.numeric(pd$Voltage)
pd$Global_intensity<- as.numeric(pd$Global_intensity)
pd$Sub_metering_1 <- as.numeric(pd$Sub_metering_1)
pd$Sub_metering_2<- as.numeric(pd$Sub_metering_2)
pd$Sub_metering_3<- as.numeric(pd$Sub_metering_3)

subsetdata<- subset(pd, Date == "2007-02-01" | Date == "2007-02-02")
png("plot3.png", width=480, height=480)
with(subsetdata, plot(MergedTimeDate, Sub_metering_1, Type ="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$MergedTimeDate, subsetdata$Sub_metering_2, type= "l", col= "red")
lines(subsetdata$MergedTimeDate, subsetdata$Sub_metering_3, type= "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, ldw= 2, col = c("black", "red", "blue"))
dev.off()
#}