## Aim of this function is to 
  ## read data
  powerdata <- read.table("R/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
 
  ## subset data from 2007-02-01 and 2007-02-02
  powerdata_01 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

  ## plot histogram of global active power for those 2 days
  hist(as.numeric( powerdata_01$Global_active_power), main= " Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = " Frequency", col = "red")
   
  ## write to the png file
   dev.copy(png, file="plot1.png", height=480, width=480)
   dev.off()
  
  
   
