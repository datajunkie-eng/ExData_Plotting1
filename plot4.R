library("data.table")
library("dplyr")
library("lubridate")

data.file <- "data/household_power_consumption.txt"
header <- fread(data.file, nrows=0)
data <- fread(paste0("grep \"^[12]/2/2007\" ", data.file))
names(data) <- names(header)

data <- mutate(data, ts = dmy_hms(paste(Date, Time)))

png(filename="plot4.png", bg = "transparent")
par(mfrow=c(2,2))
with(data, {
  plot(ts, Global_active_power, 
       xlab="",
       ylab="Global Active Power",
       type="l")
  
  
  plot(ts,Voltage, 
       xlab="datetime",
       type="l"
       )
  
  plot(ts, Sub_metering_1, 
       type="n",
       ylab="Energy sub metering",
       xlab="")
  points(ts, Sub_metering_1, type="l")
  points(ts, Sub_metering_2, type="l", col="red")
  points(ts, Sub_metering_3, type="l", col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
  
  plot(ts, Global_reactive_power, 
       xlab="datetime",
       ylab="Global_reactive_power",
       type="l")
})
dev.off()
