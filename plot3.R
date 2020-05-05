## read data
  powerdata <- read.table("R/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
 
  ## subset data from 2007-02-01 and 2007-02-02
  powerdata_01 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))


 ## Plot 3
  powerdata_01$Date <- as.Date(powerdata_01$Date, format="%d/%m/%Y")
  DateTime <- paste(as.Date(powerdata_01$Date), powerdata_01$Time)
  powerdata_01$DateTime <- as.POSIXct(DateTime)
  
  powerdata_01$Sub_metering_1 <- as.numeric(powerdata_01$Sub_metering_1)
  powerdata_01$Sub_metering_2 <- as.numeric(powerdata_01$Sub_metering_2)
  powerdata_01$Sub_metering_3 <- as.numeric(powerdata_01$Sub_metering_3)
  
  with(powerdata_01, {
    plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='red')
    lines(Sub_metering_3~DateTime,col='blue')
  })
  
  
  #plot legend
  legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)
  
  ## write to the png file
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
  
