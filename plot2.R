#1. Loading data
setwd("C:/Users/Dell/Desktop/Course-project-1/ExData_Plotting1")
if(!file.exists("./data")) {dir.create("./data")}
unzip("C:/Users/Dell/Desktop/Course-project-1/ExData_Plotting1/power_consumption.zip", exdir = "./data")
#2. Reading data
df <- read.table("./data/household_power_consumption.txt",header = TRUE, nrows = 2075259, check.names = FALSE, sep = ";" , na.strings = "?")
subdf <- subset(df, df$Date == "1/2/2007"|df$Date == "2/2/2007")
subdf$Date <- as.Date(subdf$Date, format = "%d/%m/%Y")
subdf$datetime <- as.POSIXct(paste(as.Date(subdf$Date), subdf$Time))
#3. Plotting data
png("plot2.png", width = 480, height = 480)
with(subdf, {plot(Global_active_power~datetime, type = "l" ,xlab = "", ylab = "Global Active Power" )})
dev.off()