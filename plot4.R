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
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,2))
with(subdf, {plot(Global_active_power~datetime, type = "l" ,xlab = "", ylab = "Global Active Power" )})
with(subdf, {plot(Voltage~datetime, type = "l" ,xlab = "Datetime", ylab = "Voltage" )})
plot(subdf$datetime,subdf$Sub_metering_1, type = "n",xlab = "", ylab = "Energy sub metering", col ="black")
with(subdf, lines(datetime, Sub_metering_1, type = "l", col = "black"))
with(subdf, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(subdf, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
with(subdf, {plot(Global_reactive_power~datetime, type = "l" ,xlab = "Datetime", ylab = "Global Reactive Power" )})
dev.off()