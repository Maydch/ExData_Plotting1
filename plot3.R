
##Prepare data
mydata3 <- read.table("household_power_consumption.txt"
                      , header=TRUE
                      , sep = ";"
                      , na.strings = "?"
                      , colClasses = c("character","character","numeric"
                                       ,"numeric","numeric","numeric"
                                       ,"numeric","numeric","numeric"))

subData3 <- subset(mydata3,Date=="1/2/2007" | Date == "2/2/2007")

##convert Date & Time
subData3$Date <- as.Date(subData3$Date, format = "%d/%m/%Y")

subData3$Time <- strptime(subData3$Time, format = "%H:%M:%S")

subData3$Time <- format(subData3$Time,"%H:%M:%S")

#combine Date and Time
subData3$DateTime <- as.POSIXct(paste(subData3$Date,subData3$Time)) 


##making Line graph
plot(subData3$DateTime, subData3$Sub_metering_1 
                , type = "n"
                , ylab = "Energy sub metering"
                , xlab = "")
points(subData3$DateTime, subData3$Sub_metering_1 
     , type = "line")
points(subData3$DateTime, subData3$Sub_metering_2
     , type = "line"
     , col = "red")
points(subData3$DateTime, subData3$Sub_metering_3
       , type = "line"
       , col = "blue")
legend("topright", col = c("black","red", "blue"),lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##Save to PNG  
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
