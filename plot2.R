#read data from
householdPowerConsumption <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep=";", na.strings = "?")

# prepare date
tmpTime <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time, sep = " ");
householdPowerConsumption$Time <- strptime(tmpTime, format = "%d/%m/%Y %H:%M:%S")
householdPowerConsumption[, 1] <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")

# Get data at date "2007-02-01" and "2007-02-02"
householdPowerConsumption <- householdPowerConsumption[format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-01" | format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-02" ,]

# plot
png(filename = "plot2.png")
plot(householdPowerConsumption$Time, householdPowerConsumption$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()
