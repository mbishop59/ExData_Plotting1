## To reproduce the creation of plot1.png, source this script in R
## This script simply reads the entire data file, filters it, then
## plots a histogram of the filtered data in PNG format to plot1.png

file <- "./data/household_power_consumption.txt"
cc   = c("character", "character", "numeric", "numeric",
         "numeric", "numeric", "numeric", "numeric", "numeric")
colnames <- scan(file, nlines = 1, sep = ";", what = "character")
dat   <- read.table(file, col.names = colnames, sep = ';', na.strings = '?',
                    skip = 66637, nrows = 2880, colClasses = cc)

png(file = "./ExData_Plotting1/plot1.png", width = 480, height = 480,
    units = "px")
hist(dat$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
