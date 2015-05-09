#Load data
householdpowerdata <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
#Paste date and time together
householdpowerDT <- paste(householdpowerdata$Date,householdpowerdata$Time)
#Convert to POSIXct
householdpowerdata$DateTime <- strptime(householdpowerDT,format="%d/%m/%Y %H:%M:%S")

#Pick out feb 1 and feb 2
endtime <- strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S")
starttime <- strptime("31/1/2007 23:59:59",format="%d/%m/%Y %H:%M:%S")
febdata <- householdpowerdata[householdpowerdata$DateTime<endtime & householdpowerdata$DateTime>starttime & is.numeric(householdpowerdata$Global_active_power),]

#PNG graphics device
png("plot4.png",480,480)

par(mfrow=c(2,2))

#Graph 1
plot(febdata$DateTime,febdata$Global_active_power,ylab="Global Active Power",xlab="",type="l")

#Graph 2
plot(febdata$DateTime,febdata$Voltage,ylab="Voltage",xlab="datetime",type="l")

#Graph 3
plot(febdata$DateTime,febdata$Sub_metering_1,ylim=range(febdata$Sub_metering_1,na.rm=TRUE),ylab="Energy sub metering",type="l",xlab="")
lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")

#Graph 4
plot(febdata$DateTime,febdata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()