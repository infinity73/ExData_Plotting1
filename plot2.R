data <- read.table('E:/Downloads1/Compressed/household_power_consumption.txt', sep = ";", header = TRUE)

#extract data for required dates
data_req <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#convert the Time column into object of class 'POSIXlt'
data_req$Time <- paste(as.Date(data_req$Date, '%e/%m/%Y'), data_req$Time)
data_req$Time <- strptime(data_req$Time, "%Y-%m-%d %H:%M:%S")

#convert Global Active Power values from factor to numeric
data_req$Global_active_power <- as.character(data_req$Global_active_power)
data_req$Global_active_power <- as.numeric(data_req$Global_active_power)

#open graphics device png(default format is 480x480), plot graph and then close device
png(filename = 'plot2.png')
with(data_req, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)',
                    xlab = ''))
dev.off()




