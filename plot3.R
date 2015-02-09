#read data from
householdPowerConsumption <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep=";", na.strings = "?")

# prepare date
tmpTime <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time, sep = " ");
householdPowerConsumption$Time <- strptime(tmpTime, format = "%d/%m/%Y %H:%M:%S")
householdPowerConsumption[, 1] <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")

# Get data at date "2007-02-01" and "2007-02-02"
householdPowerConsumption <- householdPowerConsumption[format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-01" | format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-02" ,]

# plot
png(filename = "plot3.png")
plot(householdPowerConsumption$Time, householdPowerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(householdPowerConsumption$Time, householdPowerConsumption$Sub_metering_2, type = "l", col = "red")
lines(householdPowerConsumption$Time, householdPowerConsumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd =1)  #add legend
dev.off()
