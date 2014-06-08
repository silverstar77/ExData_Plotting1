fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Electric power consumption.zip") 
list.files("./")
unzip("./Electric power consumption.zip")

pconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")
pconsumption$Date <- as.Date(pconsumption$Date,format="%d/%m/%Y")
FebCons <- subset(pconsumption,Date=="2007-02-01" | Date=="2007-02-02")

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(FebCons$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
