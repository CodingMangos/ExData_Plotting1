# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset data for February 1 to February 2 of 2007
dt <- data[66637:69516, ]

# Subset data for Global Active Power
y <- as.numeric(as.vector(dt$Global_active_power))
date <- as.POSIXct(paste(dt$Date, dt$Time), format="%d/%m/%Y %H:%M:%S")

# Open the png device
png(filename="plot2.png", width=480, height=480)

# Construct the plot with titles and red fill color for bins
plot(d, y, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)

# End
dev.off()