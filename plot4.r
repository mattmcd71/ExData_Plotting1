library(dplyr)

hpc <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings = '?')

hpc <- hpc %>%
        mutate(Date=as.Date(Date, format='%d/%m/%Y'), Time=strptime(Time, '%H:%M:%S')) %>%
        filter(Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format='%Y-%m-%d %H:%M:%S')


png(file='plot4.png', width=480, height=480)

par(mfrow=c(2,2))


plot(hpc$datetime, hpc$Global_active_power, type='l', xlab='', ylab='Global Activer Power')

plot(hpc$datetime, hpc$Voltage, type='l', xlab='', ylab='Voltage')


plot(hpc$datetime, hpc$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='n')
lines(hpc$datetime, hpc$Sub_metering_2, col='red')
lines(hpc$datetime, hpc$Sub_metering_3, col='blue')

plot(hpc$datetime, hpc$Global_reactive_power, type='l', xlab='', ylab='Global Reactive Power')

#dev.copy(file='plot1.png')

dev.off()
