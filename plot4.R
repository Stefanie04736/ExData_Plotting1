# load package lubridate to manipulate dates and times
library(lubridate)

# read in data
data<-read.csv("household_power_consumption.txt",sep=";")

# convert Date
data$Date<-dmy(data$Date)

# select only the Dates 2007-02-01 and 2007-02-02
data<-data[year(data$Date)==2007 & month(data$Date)==2 & day(data$Date)<=2,]

# convert variables to numeric
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3)) 

# open graphics device png
png("plot4.png", width=480, height=480)

# create a variable datetime that combines Date and Time
datetime <- ymd_hms(paste(data$Date,data$Time,sep=" "))

# plot 4 graphs 2 by 2
par(mfrow=c(2,2))

# 1.plot: Global_active_power versus datetime
# set labels for axis 
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# 2. plot: Voltage versus datetime
# set labels for axis
plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

# 3. plot: Sub_metering_1 - 3 versus datetime
# set labels for axis
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
# include plots of Sub_metering_2 and Sub_metering_3_versus datetime
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")

# 4. plot: Global_reactive_power versus datetime
# set labels for axis
plot(datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# close graphics device
dev.off()

