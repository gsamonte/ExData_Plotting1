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
png("plot2.png", width=480, height=480)
with(data=pwrConsumption2,
     plot(
       DateTime, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)"
     ))
dev.off()