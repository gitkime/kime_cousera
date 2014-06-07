if (!file.exists("data")){
  dir.create("data")
}
png(file="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
house_2007 <- read.csv("./data/household_power_consumption.txt",header=FALSE, sep=";",
                       quote="",na.strings="?",skip=66638,nrows=2880,
                       col.names=c("Date","Time","Global_active_power",
                                   "Global_reactive_power","Voltage","Global_intensity",
                                   "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
daytime <- paste(house_2007$Date,as.character(house_2007$Time))
daytime <- strptime(paste(as.character(house_2007$Date),as.character(house_2007$Time)),"%d/%m/%Y %H:%M:%S")
with(house_2007, {
  plot(daytime,house_2007$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(daytime,house_2007$Voltage,type="l",xlab="datetime",ylab="Voltage")

with(house_2007,plot(daytime,house_2007$Sub_metering_1,type="l",xlab="",ylab="Energie sub metering"))
with(house_2007,lines(daytime,house_2007$Sub_metering_2,col="red"))
with(house_2007,lines(daytime,house_2007$Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(daytime,house_2007$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
