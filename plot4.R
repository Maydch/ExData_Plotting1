
##Prepare data
mydata4 <- read.table("household_power_consumption.txt"
                      , header=TRUE
                      , sep = ";"
                      , na.strings = "?"
                      , colClasses = c("character","character","numeric"
                                       ,"numeric","numeric","numeric"
                                       ,"numeric","numeric","numeric"))

subData4 <- subset(mydata4,Date=="1/2/2007" | Date == "2/2/2007")

##convert Date & Time
subData4$Date <- as.Date(subData4$Date, format = "%d/%m/%Y")

subData4$Time <- strptime(subData4$Time, format = "%H:%M:%S")

subData4$Time <- format(subData4$Time,"%H:%M:%S")

#combine Date and Time
subData4$DateTime <- as.POSIXct(paste(subData4$Date,subData4$Time)) 


##making Line graph
par(mfcol=c(2,2), mar=c(4,4,2,1))

#plot1
plot(subData4$DateTime ,subData4$Global_active_power
     , type = "line"
     , xlab = ""
     , ylab = "Global Active Power")

#plot2
plot(subData4$DateTime, subData4$Sub_metering_1 
     , type = "n"
     , ylab = "Energy sub metering"
     , xlab = "")
points(subData4$DateTime, subData4$Sub_metering_1 
       , type = "line")
points(subData4$DateTime, subData4$Sub_metering_2
       , type = "line"
       , col = "red")
points(subData4$DateTime, subData4$Sub_metering_3
       , type = "line"
       , col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n",
       cex = 0.65,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot3
plot(subData4$DateTime ,subData4$Voltage
     , type = "line"
     , xlab = "datetime"
     , ylab = "Voltage")

#plot4
plot(subData4$DateTime ,subData4$Global_reactive_power
     , type = "line"
     , xlab = "datetime"
     , ylab = "Global_reactive_power")

##Save to PNG  width of 480 pixels and a height of 480 pixels.
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
