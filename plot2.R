# load package lubridate to manipulate dates and times
library(lubridate)

# read in data
data<-read.csv("household_power_consumption.txt",sep=";")

# convert Date
data$Date<-dmy(data$Date)

# select only the Dates 2007-02-01 and 2007-02-02
data<-data[year(data$Date)==2007 & month(data$Date)==2 & day(data$Date)<=2,]

# convert variable Global_active_power to numeric
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

# open graphics device png
png("plot2.png", width=480, height=480)

# create a variable datetime that combines Date and Time
datetime <- ymd_hms(paste(data$Date,data$Time,sep=" "))

# plot Global_active_power versus datetime
# set labels for axis 
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# close graphics device
dev.off()