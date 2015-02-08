## R Script to produce a line plot of Energy sub metering for the days of
## Feb. 1, 2007 and Feb. 2, 2007
## skipping lines and reading only needed rows speeds up read.table()
## considerably

cc    <- c("character", "character", "numeric", "numeric", "numeric",
           "numeric", "numeric", "numeric", "numeric" )
fname <- "data/household_power_consumption.txt"
colnames <- scan(fname, nlines = 1, sep = ";", what = "character")
dat   <- read.table(fname, col.names = colnames, sep = ';', na.strings = '?',
                    skip = 66637, nrows = 2880, colClasses = cc)
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
secPerDay <- 60 * 60 * 24
dayseq <- seq(min(dat$DateTime), max(dat$DateTime)+secPerDay, by = "day")
png(file = "./ExData_Plotting1/plot3.png", width=480, height=480, units="px")
plot(dat$DateTime, dat$Sub_metering_1,xaxt = "n",type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat$DateTime, dat$Sub_metering_2,col="red")
lines(dat$DateTime, dat$Sub_metering_3,col="blue")
axis.POSIXct(1, at = dayseq, "%a")
legend("topright", col=c("black","red","blue"),lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
