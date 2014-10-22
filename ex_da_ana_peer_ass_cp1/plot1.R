if (!file.exists("data")){
  dir.create("data")
}
png(file="plot1.png")
house_2007 <- read.csv("./data/household_power_consumption.txt",header=FALSE, sep=";",
                       quote="",na.strings="?",skip=66638,nrows=2880,
                       col.names=c("Date","Time","Global_active_power",
                      "Global_reactive_power","Voltage","Global_intensity",
                      "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hist(house_2007$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
main="Global Active Power")
dev.off()

