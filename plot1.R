data <- read.table('E:/Downloads1/Compressed/household_power_consumption.txt', sep = ";", header = TRUE)

#extract data for required dates
data_req <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#convert Global Active Power values from factor to numeric
data_req$Global_active_power <- as.character(data_req$Global_active_power)
data_req$Global_active_power <- as.numeric(data_req$Global_active_power)

#open graphics device png(default format is 480x480), plot histogram and then close device
png(filename = 'plot1.png')
hist(data_req$Global_active_power, main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red')
dev.off()