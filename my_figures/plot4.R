# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset data for February 1 to February 2 of 2007
dt <- data[66637:69516, ]
date <- as.POSIXct(paste(dt$Date, dt$Time), format="%d/%m/%Y %H:%M:%S")

# Open the png device
png(filename="plot2.png", width=480, height=480)

# Global settings
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))

# Plot 1
gap <- as.numeric(as.vector(dt$Global_active_power))
plot(date, gap, type="l", ylab="Global Active Power", xlab=NA)

# Plot 2
v <- as.numeric(as.vector(dt$Voltage))
plot(date, v, type="l", ylab="Voltage", xlab="datetime")

# Plot 3
sm1 <- as.numeric(as.vector(dt$Sub_metering_1))
sm2 <- as.numeric(as.vector(dt$Sub_metering_2))
sm3 <- as.numeric(as.vector(dt$Sub_metering_3))
plot(date, sm1, type="l", ylab="Energy sub metering", xlab=NA)
lines(date, sm2, col="red")
lines(date, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))
# REMOVE lines around Legend

# Plot 4
grp <- as.numeric(as.vector(dt$Global_reactive_power))
plot(date, grp, type="l", ylab="Global_reactive_power", xlab="datetime")

# End
dev.off()