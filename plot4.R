#Read from file
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")

#subset data
sub <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

#convert to date class
dateTime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#convert to numeric class for plotting
globalActivePower <- as.numeric(sub$Global_active_power)
globalReactivePower <- as.numeric(sub$Global_reactive_power)
voltage <- as.numeric(sub$Voltage)

subMetering1 <- as.numeric(sub$Sub_metering_1)
subMetering2 <- as.numeric(sub$Sub_metering_2)
subMetering3 <- as.numeric(sub$Sub_metering_3)

#plot on screen

par(mfrow = c(2, 2)) 

#1
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#2
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#3
plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#4
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#copy to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



