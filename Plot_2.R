## Pepe Zamarripa
## Exploratory analysis
## Quiz 1
## Date: May 28th, 2023
## Plot 2

library("data.table")

#Reads data from the file household_power_consumption.txt
powerDB <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Change "Global Active Power" to numeric
powerDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Creatimg a POSIXct date variable to filter the time of day
powerDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDB <- powerDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

## Display Plot 2
png("plot_2.png", width=480, height=480)
plot(x = powerDB[,dateTime], y = powerDB[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()