# load package lubridate to manipulate dates and times
library(lubridate)

# read in data
data<-read.csv("household_power_consumption.txt",sep=";")

# convert Date
data$Date<-dmy(data$Date)

# select only the Dates 2007-02-01 and 2007-02-02
data<-data[year(data$Date)==2007 & month(data$Date)==2 & day(data$Date)<=2,]

# convert variables Sub_metering_1 - 3 to numeric
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))                                          

# open graphics device png
png("plot3.png", width=480, height=480)

# create a variable datetime that combines Date and Time
datetime <- ymd_hms(paste(data$Date,data$Time,sep=" "))

# plot Sub_metering_1 versus datetime
# set colour and label for axis
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

# include plots of Sub_metering_2 and Sub_metering_3_versus datetime
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")

# include legend
legend("topright",lwd=c(2.5,2.5),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close graphics device
dev.off()