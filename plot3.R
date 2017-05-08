#Read from file
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
sub <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

#convert to date class
dateTime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot on screen
globalActivePower <- as.numeric(sub$Global_active_power)
subMetering1 <- as.numeric(sub$Sub_metering_1)
subMetering2 <- as.numeric(sub$Sub_metering_2)
subMetering3 <- as.numeric(sub$Sub_metering_3)

plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copy to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



