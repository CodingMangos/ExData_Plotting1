# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Subset data for February 1 to February 2 of 2007
dt <- data[66637:69516, ]

# Subset data for Global Active Power
x <- as.numeric(as.vector(dt$Global_active_power))

# Open the png device
png(filename="plot1.png", width=480, height=480)

# Construct the plot with titles and red fill color for bins
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# End
dev.off()