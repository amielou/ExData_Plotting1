library(sqldf)

myFile <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep=";", sql = "select * from file where Date >= '01/01/2007' & Date <= '02/02/2007'")

edit(myFile)
rm(list=ls())
hist(myFile$Global_active_power, main = "Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red", breaks=c(0,2,4,6,8,10,12))
dev.copy(png, file="plot1.png")
dev.off()
