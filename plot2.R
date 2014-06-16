myFile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows=2076000)
mySubset <- myFile[((myFile$Date) == "1/2/2007" | (myFile$Date) == "2/2/2007"),]
mySubset$DateTime <- strptime(paste(mySubset$Date, mySubset$Time),format="%d/%m/%Y %H:%M:%S")

rm(myFile)
plot(as.numeric(as.character(mySubset$Global_active_power)) ~ as.POSIXct(mySubset$DateTime), main = "Global Active Power",ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
