## To reproduce the creation of plot1.png, source this script in R
## This script simply reads the entire data file, filters it, then
## plots a histogram of the filtered data in PNG format to plot1.png

file <- "./data/household_power_consumption.txt"
cc   = c("character", "character", "numeric", "numeric",
         "numeric", "numeric", "numeric", "numeric")
dat  <- read.table(file, header = TRUE, sep = ";", na.strings = "?",
                   nrows = 2075260, colClasses = cc)
dat2 <- with(dat, dat[Date == "1/2/2007" | Date == "2/2/2007",])

png(file = "./ExData_Plotting1/plot1.png", width = 480, height = 480,
    units = "px")
hist(dat2$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
