#1. Loading data
setwd("C:/Users/Dell/Desktop/Course-project-1/ExData_Plotting1")
if(!file.exists("./data")) {dir.create("./data")}
unzip("C:/Users/Dell/Desktop/Course-project-1/ExData_Plotting1/power_consumption.zip", exdir = "./data")
#2. Reading data
df <- read.table("./data/household_power_consumption.txt", skip = 1, sep = ";")
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subdf <- subset(df, df$Date == "2/1/2007"|df$Date == "2/2/2007")
#Plot1
subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(subdf$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()