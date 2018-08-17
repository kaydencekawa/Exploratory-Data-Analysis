######## Combined Charts
png('plot4.png')

par(mfcol=c(2,2))

######Chart 1
plot(y = subsetelectricdata$Global_active_power, x = subsetelectricdata$formattedtime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

######Chart 2
#Create the initial plot
plot(y = subsetelectricdata$Sub_metering_1, x = subsetelectricdata$formattedtime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
#Add the additional lines
lines(y = subsetelectricdata$Sub_metering_2, x = subsetelectricdata$formattedtime, type = "l", col = "red")
lines(y = subsetelectricdata$Sub_metering_3, x = subsetelectricdata$formattedtime, type = "l", col = "blue")
#Add the text
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1:3, cex=0.75, bty = "n")

######Chart3
#Convert voltage to numberic
subsetelectricdata$Voltage <- as.numeric(subsetelectricdata$Voltage)
plot(y = subsetelectricdata$Voltage, x = subsetelectricdata$formattedtime, type = "l", ylab = "Voltage", xlab = "datetime", col = "black")

######Chart4
#Convert Global reactive power to numeric
subsetelectricdata$Global_reactive_power <- as.numeric(subsetelectricdata$Global_reactive_power)
plot(y = subsetelectricdata$Global_reactive_power, x = subsetelectricdata$formattedtime, type = "l", ylab = "Global_reactive_power", xlab = "datetime", col = "black")

dev.off()