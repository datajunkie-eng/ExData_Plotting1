library("data.table")
library("dplyr")
library("lubridate")

data.file <- "data/household_power_consumption.txt"
header <- fread(data.file, nrows=0)
data <- fread(paste0("grep \"^[12]/2/2007\" ", data.file))
names(data) <- names(header)

data <- mutate(data, ts = dmy_hms(paste(Date, Time)))

png(filename="plot2.png", bg = "transparent")
with(data, 
     plot(ts, Global_active_power, 
          xlab="",
          ylab="Global Active Power (kilowatts)",
          type="l")
)
dev.off()
