dat <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(dat) <- c("Date", "Time", "Global_active_power", "Global_Reactive_power",
                "voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3")
power <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

hist(as.numeric(as.character(power$Global_active_power)), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power(Kilowatts)")

title(main = "Global Avtive Power")