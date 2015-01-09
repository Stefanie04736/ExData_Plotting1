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
png("plot1.png", width=480, height=480)

# plot the histogram
# set colour, label for x-axis and title
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# close graphics device
dev.off()
