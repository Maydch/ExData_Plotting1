
##Prepare data
mydata <- read.table("household_power_consumption.txt"
                      , header=TRUE
                      , sep = ";"
                      , na.strings = "?"
                      , colClasses = c("character","character","numeric"
                                      ,"numeric","numeric","numeric"
                                      ,"numeric","numeric","numeric"))

subData <- subset(mydata,Date=="1/2/2007" | Date == "2/2/2007")

##convert Date
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")

subData$Time <- strptime(subData$Time, format = "%H:%M:%S")

subData$Time <- format(subData$Time,"%H:%M:%S")

##making histogram
hist(subData$Global_active_power, col = "red"
      ,main = "Global Active Power"
      ,xlab = "Global Active Power(kilowatts)" )

##Save to PNG 
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
