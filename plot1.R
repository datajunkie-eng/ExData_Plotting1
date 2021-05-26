library("data.table")

data.file <- "data/household_power_consumption.txt"
header <- fread(data.file, nrows=0)
data <- fread(paste0("grep \"^[12]/2/2007\" ", data.file))
names(data) <- names(header)

png(filename="plot1.png", bg = "transparent")
with(data, 
    hist(Global_active_power, 
          xlab="Global Active Power (kilowatts)",
          main="Global Active Power",
          col="red")
)
dev.off()
