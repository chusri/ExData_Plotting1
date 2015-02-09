#read data from household_power_consumption.txt
householdPowerConsumption <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep=";", na.strings = "?")

# prepare date
tmpTime <- paste(householdPowerConsumption$Date, householdPowerConsumption$Time, sep = " ");
householdPowerConsumption$Time <- strptime(tmpTime, format = "%d/%m/%Y %H:%M:%S")
householdPowerConsumption[, 1] <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")

# Get data at date "2007-02-01" and "2007-02-02"
householdPowerConsumption <- householdPowerConsumption[format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-01" | format(householdPowerConsumption$Date, "%Y-%m-%d") == "2007-02-02" ,]

# plot
png(filename = "plot1.png")      #make png of histogram
hist(householdPowerConsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()
