setwd("/Users/katek10147/Documents/R Programming")

#Read in the whole dataset
electricitydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#Rename data column
names(electricitydata)[1] <- "dates"
#Reformat date format
electricitydata$dates <- as.Date(electricitydata$dates, format = "%d/%m/%Y")
#Subset based on the given dates
subsetelectricdata <- subset(electricitydata, dates == "2007-02-01" | dates == "2007-02-02")
subsetelectricdata$Global_active_power <- as.numeric(subsetelectricdata$Global_active_power)

######Histogram 1
hist(subsetelectricdata$Global_active_power, breaks = 12, col = "Red", ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, 'plot1.png')
dev.off()

######Line Graph 1
#Format the Date
subsetelectricdata$formattedtime <- as.POSIXct(paste(subsetelectricdata$dates, subsetelectricdata$Time, format = "%Y-%m-%d %H:%M:%S"))
plot(y = subsetelectricdata$Global_active_power, x = subsetelectricdata$formattedtime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, 'plot2.png')
dev.off()

######Line Graph 2
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
dev.copy(png, 'plot3.png')
dev.off()

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

#dev.copy(png, 'plot4.png')
dev.off()