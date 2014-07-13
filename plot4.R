##-----Reading the Data-----
##First, select your working directory, then download the data and unzip.

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Electric power consumption.zip") 
list.files("./")
unzip("./Electric power consumption.zip")
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")

##Format the date variable and select only the required two dates.
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
data <- subset(df,Date=="2007-02-01" | Date=="2007-02-02")
time <- paste(data$Date,data$Time, collapse=NULL)
data$Date_Time <- strptime(time,format="%Y-%m-%d %H:%M:%S")

##-----Drawing the Plot in PNG File Device-----
png(filename = "plot4.png",width = 480, height = 480, units = "px")

par(mfcol=c(2,2))

plot(data$Date_Time, data$Global_active_power,type="S", ylab="Global Active Power (kilowatts)",xlab=NA)
plot(data$Date_Time, data$Sub_metering_1, type="l", ylab="Energy sub metering",xlab=NA)
lines(data$Date_Time, data$Sub_metering_2, col="red")
lines(data$Date_Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty ="n")
plot(data$Date_Time, data$Voltage, xlab="datetime", ylab="Volage", type="l")
plot(data$Date_Time, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_Power", type="l")

dev.off()
