hpc <- read.csv("household_power_consumption.txt", colClasses = colclasses, na.strings=c("?"), sep=";")
hpc1 <- within(hpc, DateTime <- paste(Date, Time, sep=" "))
hpc1$DateTime = as.POSIXct(strptime(hpc1$DateTime, format = "%d/%m/%Y %H:%M:%S"))
hpc1 = subset(hpc1, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

png(filename="plot2.png", width = 480, height = 480)
with(hpc1, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
