myFile <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", nrows=2076000)
mySubset <- myFile[((myFile$Date) == "1/2/2007" | (myFile$Date) == "2/2/2007"),]
mySubset$DateTime <- strptime(paste(mySubset$Date, mySubset$Time),format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
rm(myFile)


plot(as.POSIXct(mySubset$DateTime), mySubset$Sub_metering_1, xlab="Energy sub metering", ylab="", type="l", ylim=c(0,35))
points(as.POSIXct(mySubset$DateTime), mySubset$Sub_metering_2, col="red", type="l")
points(as.POSIXct(mySubset$DateTime), mySubset$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), pch="-", col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

