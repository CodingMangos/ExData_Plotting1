# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset data for February 1 to February 2 of 2007
dt <- data[66637:69516, ]

# Subset data for Global Active Power
sm1 <- as.numeric(as.vector(dt$Sub_metering_1))
sm2 <- as.numeric(as.vector(dt$Sub_metering_2))
sm3 <- as.numeric(as.vector(dt$Sub_metering_3))
date <- as.POSIXct(paste(dt$Date, dt$Time), format="%d/%m/%Y %H:%M:%S")

# Open the png device
png(filename="plot3.png", width=480, height=480)

# Construct the plot
plot(d, sm1, type="l", ylab="Energy sub metering", xlab=NA)
lines(d, sm2, col="red")
lines(d, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# End
dev.off()