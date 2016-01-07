# Set local working parameters, unzip data file and read it in
setwd("/media/sf_Dropbox/Technology/R/coursera/4 Exploratory Data Analysis/assignment1/ExData_Plotting1/")
dat.file <- unz("./data/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
dat.0 <- read.table(dat.file, nrows = 800000, header = TRUE, quote = "\"", stringsAsFactors = FALSE, sep = ";", dec = ".") # nrows to keep it a bit smaller (size determined through looking at dataset - needs to encompass our dates)

# Subset only the data that is relevant to our interest
dat <- dat.0[dat.0$Date %in% c("1/2/2007", "2/2/2007"),]

# Converting date and time values
dat$datetime <- strptime(x = paste(dat$Date, dat$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S") 

# Global Active Power as a numeric value
dat$Global_active_power <- as.numeric(dat$Global_active_power) 

# Create a PNG with specified dimensions
png("plot1.png", width = 504, height = 504) 
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") # Change colour of bars to red, title and x labels
dev.off()
