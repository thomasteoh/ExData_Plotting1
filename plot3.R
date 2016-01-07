setwd("/media/sf_Dropbox/Technology/R/coursera/4 Exploratory Data Analysis/assignment1/ExData_Plotting1/")
dat.file <- unz("./data/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
dat.0 <- read.table(dat.file, nrows = 800000, header = TRUE, quote = "\"", stringsAsFactors = FALSE, sep = ";", dec = ".") # importing dataset, nrows to keep it a bit smaller

dat <- dat.0[dat.0$Date %in% c("1/2/2007", "2/2/2007"),] # subsetting only the data that is relevant to our interests

dat$datetime <- strptime(x = paste(dat$Date, dat$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S") # Converting to date and time

dat$Global_active_power <- as.numeric(dat$Global_active_power) # Global Active Power in KW

png("plot3.png", width=504, height=504) # Create a PNG with specified dimensions
plot(x = dat$datetime, y = dat$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
lines(x = dat$datetime, y = dat$Sub_metering_2, col = "red")
lines(x = dat$datetime, y = dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))
dev.off()
