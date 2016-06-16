library(data.table)
setwd(".")
h_p_s <- fread("household_power_consumption.txt", sep="auto", sep2="auto", nrows=-1L,
               header="auto", na.strings="?", stringsAsFactors=FALSE)
temp_period <- subset(h_p_s, h_p_s$Date == "1/2/2007" | h_p_s$Date == "2/2/2007")
dt <- as.POSIXct(strptime(paste(temp_period$Date, temp_period$Time), "%d/%m/%Y %H:%M:%S"))
consume_period <- cbind(dt, temp_period)
#
plot(consume_period$dt, consume_period$Sub_metering_1, type = "l", col = "black", xlab = "",
              ylab = "Energy sub metering")
lines(consume_period$dt, consume_period$Sub_metering_2, col = "red")
lines(consume_period$dt, consume_period$Sub_metering_3, col = "blue")
legend("topright", pch=c(95,95,95), col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()