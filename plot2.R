## R Script to produce a line plot of Global active power for the days of
## Feb. 1, 2007 and Feb. 2, 2007

cc    <- c("character", "character", "numeric", "numeric", "numeric",
           "numeric", "numeric", "numeric", "numeric" )
fname <- "data/household_power_consumption.txt"
colnames <- scan(fname, nlines = 1, sep = ";", what = "character")
dat   <- read.table(fname, col.names = colnames, sep = ';', na.strings = '?',
                    skip = 66637, nrows = 2880, colClasses = cc)
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
secPerDay <- 60 * 60 * 24
dayseq <- seq(min(dat$DateTime), max(dat$DateTime)+secPerDay, by = "day")
fpng   <- "./ExData_Plotting1/plot2.png"
days   <- strftime(dayseq,"%a")
png(file = fpng, width = 480, height = 480, units = "px")
plot(dat$DateTime, dat$Global_active_power,xaxt = "n",type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
axis.POSIXct(1, at = dayseq, "%a")
dev.off()
