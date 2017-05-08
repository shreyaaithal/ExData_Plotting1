#Read from file
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
sub <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

#convert to date class
dateTime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot on screen
globalActivePower <- as.numeric(sub$Global_active_power)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#copy to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()