#read data
setwd("C:/Users/gresam03/Documents/Coursera Data Science/Exploratory Data Analysis")
pwrConsumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
pwrConsumption$Date <- as.Date(pwrConsumption$Date, format="%d/%m/%Y")

#subset data
pwrConsumption2 <- pwrConsumption[(pwrConsumption$Date <= "2007-02-02" & pwrConsumption$Date >= "2007-02-01"),]
rm(pwrConsumption)

#graph data
png("plot1.png", width=480, height=480)
hist(as.numeric(pwrConsumption2$Global_active_power), col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
