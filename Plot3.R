hpc <- read.csv("household_power_consumption.txt", colClasses = colclasses, na.strings=c("?"), sep=";")

hpc1 <- within(hpc, DateTime <- paste(Date, Time, sep=" "))

hpc1$DateTime = as.POSIXct(strptime(hpc1$DateTime, format = "%d/%m/%Y %H:%M:%S"))

hpc1 = subset(hpc1, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

png(filename="plot3.png", width = 480, height = 480)
with(hpc1, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(hpc1, lines(DateTime, Sub_metering_2, col="red", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(hpc1, lines(DateTime, Sub_metering_3, col="blue", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"))
dev.off()
