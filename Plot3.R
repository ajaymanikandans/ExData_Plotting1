dat <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
power <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(power$Time, power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(power, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(power, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(power, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy Sub-metering")