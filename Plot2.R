######Line Graph 1
#Format the Date
png('plot2.png')
subsetelectricdata$formattedtime <- as.POSIXct(paste(subsetelectricdata$dates, subsetelectricdata$Time, format = "%Y-%m-%d %H:%M:%S"))
plot(y = subsetelectricdata$Global_active_power, x = subsetelectricdata$formattedtime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()