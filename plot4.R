  
  ## read data
  powerdata <- read.table("R/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
 
  ## subset data from 2007-02-01 and 2007-02-02
  powerdata_01 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

 #format data
   powerdata_01$Sub_metering_1 <- as.numeric(powerdata_01$Sub_metering_1)
   powerdata_01$Sub_metering_2 <- as.numeric(powerdata_01$Sub_metering_2)
   powerdata_01$Sub_metering_3 <- as.numeric(powerdata_01$Sub_metering_3)
 
   powerdata_01$Voltage<-as.numeric(powerdata_01$Voltage)
   powerdata_01$Global_reactive_power<-as.numeric(powerdata_01$Global_reactive_power)
   powerdata_01$Global_active_power<-as.numeric(powerdata_01$Global_active_power)
  
   powerdata_01$Date <- as.Date(powerdata_01$Date, format="%d/%m/%Y")
   DateTime <- paste(as.Date(powerdata_01$Date), powerdata_01$Time)
   powerdata_01$DateTime <- as.POSIXct(DateTime)
  
 
  
  ## Plot 4 
  #margin   on the four sides of the plot.
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
  with(powerdata_01, {
    plot(Global_active_power~DateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~DateTime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~DateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
   
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),text.font=2, cex =0.6)
   
     plot(Global_reactive_power~DateTime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })
  
  ## write to the png file
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
