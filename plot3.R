## R Script to produce a line plot of Energy sub metering for the days of
## Feb. 1, 2007 and Feb. 2, 2007

cc    <- c("character", "character", "numeric", "numeric", "numeric",
           "numeric", "numeric", "numeric", "numeric" )
fname <- "data/household_power_consumption.txt"
dat   <- read.table(fname, header = TRUE, sep = ';', na.strings = '?',
                    nrows = 2075265, colClasses = cc)
dat2  <- with(dat, dat[Date == "1/2/2007" | Date == "2/2/2007",])
dat2$Date <- strptime(dat2$Date, "%d/%m/%Y")
secPerDay <- 60 * 60 * 24
dayseq <- seq(min(dat2$Date), max(dat2$Date)+secPerDay, by = "day")
fpng   <- "./ExData_Plotting1/plot3.png"
days   <- strftime(dayseq,"%a")
opar   <- par(no.readonly = TRUE)
png(file = fpng, width = 480, height = 480, units = "px")
par(mar = c(5,4,4,1))
plot(dat2$Sub_metering_1,xaxt = "n",type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat2$Sub_metering_2,col="red")
lines(dat2$Sub_metering_3,col="blue")
axis(1, at = c(1,1440, 2880), label = days)
legend("topright", col=c("black","red","blue"),lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
