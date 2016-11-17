data <- read.table('E:/Downloads1/Compressed/household_power_consumption.txt', sep = ";", header = TRUE)

#extract data for required dates
data_req <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#convert the Time column into object of class 'POSIXlt'
data_req$Time <- paste(as.Date(data_req$Date, '%e/%m/%Y'), data_req$Time)
data_req$Time <- strptime(data_req$Time, "%Y-%m-%d %H:%M:%S")


#convert Sub_meterin_1 values from factor to numeric
data_req$Sub_metering_1 <- as.character(data_req$Sub_metering_1)
data_req$Sub_metering_1 <- as.numeric(data_req$Sub_metering_1)

#open graphics device png(default format is 480x480)
png(filename = 'plot3.png')

#plot Sub_metering_1
with(data_req, plot(Time, Sub_metering_1, type = 'l', xlab = '',
                    ylab = 'Energy sub metering'))

#convert Sub_meterin_2 values from factor to numeric
data_req$Sub_metering_2 <- as.character(data_req$Sub_metering_2)
data_req$Sub_metering_2 <- as.numeric(data_req$Sub_metering_2)

#plot Sub_metering_2
with(data_req, points(Time, Sub_metering_2, type = 'l', col = 'red'))

#convert Sub_meterin_3 values from factor to numeric
data_req$Sub_metering_3 <- as.character(data_req$Sub_metering_3)
data_req$Sub_metering_3 <- as.numeric(data_req$Sub_metering_3)

#plot Sub_metering_3
with(data_req, points(Time, Sub_metering_3, type = 'l', col = 'blue'))

legend('topright', lty = 'solid', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2',
                                                               'Sub_metering_3'))
#turn off graphics device
dev.off()