## Pepe Zamarripa
## Exploratory analysis
## Quiz 1
## Date: May 28th, 2023
## Plot 1

library("data.table")
#Reads data from the file household_power_consumption.txt
powerDB <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Change "Global Active Power" to numeric
powerDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date to Date Type
powerDB[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDB <- powerDB[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Display Plot 1
png("plot_1.png", width=480, height=480)
hist(powerDB[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="frequency", col="Tomato3")

dev.off()