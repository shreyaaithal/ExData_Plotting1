#Read from file
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data
sub <- subset(data,Date=="1/2/2007" | Date =="2/2/2007")

#plot on screen
globalActivePower <- as.numeric(sub$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()