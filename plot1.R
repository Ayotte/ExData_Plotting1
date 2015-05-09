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
png("plot1.png",480,480)

#Histogram
hist(febdata$Global_active_power,col="Red",border="Black",breaks=seq(0,10,.5),xlim=c(0,6),ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()