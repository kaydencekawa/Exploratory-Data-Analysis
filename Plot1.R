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
png('plot1.png')
hist(subsetelectricdata$Global_active_power, breaks = 12, col = "Red", ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()