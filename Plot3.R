######Line Graph 2
png('plot3.png')
#Convert meter numbers into numerics
subsetelectricdata$Sub_metering_1 <- as.numeric(subsetelectricdata$Sub_metering_1)
subsetelectricdata$Sub_metering_2 <- as.numeric(subsetelectricdata$Sub_metering_2)
subsetelectricdata$Sub_metering_3 <- as.numeric(subsetelectricdata$Sub_metering_3)

#Creat the initial plot
plot(y = subsetelectricdata$Sub_metering_1, x = subsetelectricdata$formattedtime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
#Add the additional lines
lines(y = subsetelectricdata$Sub_metering_2, x = subsetelectricdata$formattedtime, type = "l", col = "red")
lines(y = subsetelectricdata$Sub_metering_3, x = subsetelectricdata$formattedtime, type = "l", col = "blue")
#Add the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1:3)
dev.off()