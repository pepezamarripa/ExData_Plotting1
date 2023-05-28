## Pepe Zamarripa
## Exploratory analysis
## Quiz 1
## Date: May 28th, 2023
## Plot 3

library("data.table")

#Reads data from the file household_power_consumption.txt
powerDB <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Change "Global Active Power" to numeric
powerDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Creatimg a POSIXct date variable to filter the time of day
powerDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDB <- powerDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Display Plot 4
png("plot_4.png", width=480, height=480)
par(mfrow=c(2,2))

# Add Plot 1
plot(powerDB[, dateTime], powerDB[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Add Plot 2
plot(powerDB[, dateTime],powerDB[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Add Plot 3
plot(powerDB[, dateTime], powerDB[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDB[, dateTime], powerDB[, Sub_metering_2], col="Tomato3")
lines(powerDB[, dateTime], powerDB[, Sub_metering_3],col="Slategray2")
legend("topright", col=c("black","Tomato3","Slategray2")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Add Plot 4
plot(powerDB[, dateTime], powerDB[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()