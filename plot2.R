fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Electric power consumption.zip") 
list.files("./")
unzip("./Electric power consumption.zip")

pconsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")
pconsumption$Date <- as.Date(pconsumption$Date,format="%d/%m/%Y")
pconsumption$Date <- strptime(c(pconsumption$Date,pconsumption$Time))


FebCons <- subset(pconsumption,Date=="2007-02-01" | Date=="2007-02-02")
time <- paste(FebCons$Date,FebCons$Time, collapse=NULL)
FebCons$Date_Time <- strptime(time,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(FebCons$Date_Time, FebCons$Global_active_power,type="S", ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()
