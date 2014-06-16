myFile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows=2076000)
mySubset <- myFile[((myFile$Date) == "1/2/2007" | (myFile$Date) == "2/2/2007"),]
rm(myFile)
mySubset$DateTime <- strptime(paste(mySubset$Date, mySubset$Time),format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
par(mar=c(4, 4, 2, 2))
plot(as.numeric(as.character(mySubset$Global_active_power)) ~ as.POSIXct(mySubset$DateTime),ylab="Global Active Power (kilowatts)", xlab="", type="l")

plot(as.numeric(as.character(mySubset$Voltage)) ~ as.POSIXct(mySubset$DateTime),ylab="voltage", xlab="datetime", type="l")

plot(as.POSIXct(mySubset$DateTime), as.numeric(as.character(mySubset$Sub_metering_1)), xlab="", ylab="Energy sub metering", type="l")
points(as.POSIXct(mySubset$DateTime), as.numeric(as.character(mySubset$Sub_metering_2)), col="red", type="l")
points(as.POSIXct(mySubset$DateTime), as.numeric(as.character(mySubset$Sub_metering_3)), col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), pch="-", col=c("black", "red", "blue"))

plot(as.numeric(as.character(mySubset$Global_reactive_power)) ~ as.POSIXct(mySubset$DateTime),ylab="Global Reactive Power", xlab="datetime", type="l")



dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

