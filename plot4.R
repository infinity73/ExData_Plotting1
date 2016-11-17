data <- read.table('E:/Downloads1/Compressed/household_power_consumption.txt', sep = ";", header = TRUE)

#extract data for required dates
data_req <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#convert the Time column into object of class 'POSIXlt'
data_req$Time <- paste(as.Date(data_req$Date, '%e/%m/%Y'), data_req$Time)
data_req$Time <- strptime(data_req$Time, "%Y-%m-%d %H:%M:%S")

#convert Global Active Power values from factor to numeric
data_req$Global_active_power <- as.character(data_req$Global_active_power)
data_req$Global_active_power <- as.numeric(data_req$Global_active_power)

#convert Voltage values from factor to numeric
data_req$Voltage <- as.character(data_req$Voltage)
data_req$Voltage <- as.numeric(data_req$Voltage)

#convert Sub_meterin_1 values from factor to numeric
data_req$Sub_metering_1 <- as.character(data_req$Sub_metering_1)
data_req$Sub_metering_1 <- as.numeric(data_req$Sub_metering_1)

#convert Sub_meterin_2 values from factor to numeric
data_req$Sub_metering_2 <- as.character(data_req$Sub_metering_2)
data_req$Sub_metering_2 <- as.numeric(data_req$Sub_metering_2)

#convert Sub_meterin_3 values from factor to numeric
data_req$Sub_metering_3 <- as.character(data_req$Sub_metering_3)
data_req$Sub_metering_3 <- as.numeric(data_req$Sub_metering_3)

#convert Global Reactive Power values from factor to numeric
data_req$Global_reactive_power <- as.character(data_req$Global_reactive_power)
data_req$Global_reactive_power <- as.numeric(data_req$Global_reactive_power)


#open graphics device png(default format is 480x480)
png(filename = 'plot4.png')

#draw figures in a 2x2 array, filling rows first
par(mfrow = c(2, 2))

###the four plots which are to be drawn in plot4.png

#first figure
with(data_req, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = ''))
#second figure
with(data_req, plot(Time, Voltage, type = 'l', ylab = 'Voltage', xlab = 'Datetime'))
#third figure
with(data_req, plot(Time, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering'))
#addition to third figure
with(data_req, points(Time, Sub_metering_2, type = 'l', col = 'red'))
#addition to third figure
with(data_req, points(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', lty = 'solid', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2',
                                                                              'Sub_metering_3'))
#fourth figure
with(data_req, plot(Time, Global_reactive_power, type = 'l', ylab = 'Global_Reactive_Power',
                   xlab = 'Datetime'))

dev.off()



