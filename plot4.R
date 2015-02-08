## R script to produce line plots for Global active power, Voltage,
## Energy sub metering, and Global reactive power

cc  <- c("character", "character", "numeric", "numeric", "numeric",
         "numeric", "numeric", "numeric", "numeric" )
fname <- "data/household_power_consumption.txt"
colnames <- scan(fname, nlines = 1, sep = ";", what = "character")
dat   <- read.table(fname, col.names = colnames, sep = ';', na.strings = '?',
                    skip = 66637, nrows = 2880, colClasses = cc)
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
secPerDay <- 60 * 60 * 24
dayseq <- seq(min(dat$DateTime), max(dat$DateTime)+secPerDay, by = "day")
fpng   <- "./ExData_Plotting1/plot4.png"
days   <- strftime(dayseq,"%a")
opar   <- par(no.readonly = TRUE)
png(file = fpng, width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
plot(dat$DateTime, dat$Global_active_power, xaxt = "n",type = "l",
     ylab = "Global Active Power", xlab = "")
axis.POSIXct(1, at = dayseq, "%a")

plot(dat$DateTime, dat$Sub_metering_1, xaxt = "n",type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(dat$DateTime, dat$Sub_metering_2, col="red")
lines(dat$DateTime, dat$Sub_metering_3, col="blue")
axis.POSIXct(1, at = dayseq, "%a")
legend("topright", col=c("black","red","blue"),lty=c(1,1,1), bty = "n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dat$DateTime, dat$Voltage, xaxt = "n",type = "l",
     ylab = "Voltage", xlab = "datetime")
axis.POSIXct(1, at = dayseq, "%a")

plot(dat$DateTime, dat$Global_reactive_power, xaxt = "n",type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
axis.POSIXct(1, at = dayseq, "%a")
dev.off()
par(opar)
