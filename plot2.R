 ## read data
  powerdata <- read.table("R/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
 
## subset data from 2007-02-01 and 2007-02-02
  powerdata_01 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))
   
 ## Plot 2
  
  powerdata_01$Global_active_power<-as.numeric(powerdata_01$Global_active_power)
  
  powerdata_01$Date <- as.Date(powerdata_01$Date, format="%d/%m/%Y")
  DateTime <- paste(as.Date(powerdata_01$Date), powerdata_01$Time)
  powerdata_01$DateTime <- as.POSIXct(DateTime)
  
  
  with(powerdata_01, {
    plot(Global_active_power~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
  })
  
  ## write to the png file
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
  
