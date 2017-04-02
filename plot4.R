#read data
setwd("C:/Users/gresam03/Documents/Coursera Data Science/Exploratory Data Analysis")
pwrConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
pwrConsumption$Date <- as.Date(pwrConsumption$Date, format="%d/%m/%Y")

#subset data
pwrConsumption2 <- pwrConsumption[(pwrConsumption$Date <= "2007-02-02" & pwrConsumption$Date >= "2007-02-01"),]
rm(pwrConsumption)

#combine date and time
pwrConsumption2$DateTime <- strptime(paste(pwrConsumption2$Date, pwrConsumption2$Time, sep=" "),
                                     format="%Y-%m-%d %H:%M:%S")
head(pwrConsumption2)

#graph data
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#first graph is Plot 2
with(data=pwrConsumption2,
     plot(
       DateTime, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)"
     ))

#second graph is Voltage
with(data=pwrConsumption2,
     plot(
       DateTime, as.numeric(Voltage), type="l", xlab="datetime", ylab="Voltage"
     ))

#third graph is Plot 3
with(data=pwrConsumption2,
     plot(
       DateTime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"
     ))
with(data=pwrConsumption2, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
with(data=pwrConsumption2, lines(DateTime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

#fourth graph is Global Reactive Power
with(data=pwrConsumption2,
     plot(
       DateTime, as.numeric(Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power"
     ))
dev.off()