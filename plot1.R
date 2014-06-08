myFile <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", nrows=2076000)
mySubset <- myFile[((myFile$Date) == "1/2/2007" | (myFile$Date) == "2/2/2007"),]
rm(myFile)
hist(as.numeric(mySubset$Global_active_power), main = "Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

