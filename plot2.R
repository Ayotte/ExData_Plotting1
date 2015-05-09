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
png("plot2.png",480,480)

#Graph
plot(febdata$DateTime,febdata$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")

dev.off()