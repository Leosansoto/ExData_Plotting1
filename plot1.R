library(data.table)
setwd(".")
h_p_s <- fread("household_power_consumption.txt", sep="auto", sep2="auto", nrows=-1L,
               header="auto", na.strings="?", stringsAsFactors=FALSE)
temp_period <- subset(h_p_s, h_p_s$Date == "1/2/2007" | h_p_s$Date == "2/2/2007")
dt <- as.POSIXct(strptime(paste(temp_period$Date, temp_period$Time), "%d/%m/%Y %H:%M:%S"))
consume_period <- cbind(dt, temp_period)
hist(consume_period$Global_active_power, main = paste("Global Active Power"), col="red", 
              xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
