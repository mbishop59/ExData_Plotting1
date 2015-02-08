## R script to produce line plots for Global active power, Voltage,
## Energy sub metering, and Global reactive power

cc  <- c("character", "character", "numeric", "numeric", "numeric",
         "numeric", "numeric", "numeric", "numeric" )
fname <- "data/household_power_consumption.txt"
dat   <- read.table(fname, header = TRUE, sep = ';', na.strings = '?',
                    nrows = 2075265, colClasses = cc)
dat2  <- with(dat, dat[Date == "1/2/2007" | Date == "2/2/2007",])
dat2$Date <- strptime(dat2$Date, "%d/%m/%Y")
secPerDay <- 60 * 60 * 24
dayseq <- seq(min(dat2$Date), max(dat2$Date)+secPerDay, by = "day")
fpng   <- "./ExData_Plotting1/plot4.png"
days   <- strftime(dayseq,"%a")
opar   <- par(no.readonly = TRUE)
png(file = fpng, width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
plot(dat2$Global_active_power,xaxt = "n",type = "l",
     ylab = "Global Active Power",
     xlab = "")
axis(1, at = c(1,1440, 2880), label = days)
plot(dat2$Sub_metering_1,xaxt = "n",type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat2$Sub_metering_2,col="red")
lines(dat2$Sub_metering_3,col="blue")
axis(1, at = c(1,1440, 2880), label = days)
legend("topright", col=c("black","red","blue"),lty=c(1,1,1), bty = "n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dat2$Voltage,xaxt = "n",type = "l",
     ylab = "Voltage",
     xlab = "datetime")
axis(1, at = c(1,1440, 2880), label = days)
plot(dat2$Global_reactive_power,xaxt = "n",type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")
axis(1, at = c(1,1440, 2880), label = days)
dev.off()
par(opar)
