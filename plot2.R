
##Prepare data
mydata2 <- read.table("household_power_consumption.txt"
                     , header=TRUE
                     , sep = ";"
                     , na.strings = "?"
                     , colClasses = c("character","character","numeric"
                                      ,"numeric","numeric","numeric"
                                      ,"numeric","numeric","numeric"))

subData2 <- subset(mydata2,Date=="1/2/2007" | Date == "2/2/2007")

##convert Date & Time
subData2$Date <- as.Date(subData2$Date, format = "%d/%m/%Y")

subData2$Time <- strptime(subData2$Time, format = "%H:%M:%S")

subData2$Time <- format(subData2$Time,"%H:%M:%S")

#combine Date and Time
subData2$DateTime <- as.POSIXct(paste(subData2$Date,subData2$Time)) 


##making Line graph
plot(subData2$DateTime ,subData2$Global_active_power
     , type = "line"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")

##Save to PNG  
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
