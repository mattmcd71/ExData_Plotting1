library(dplyr)

hpc <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings = '?')

hpc <- hpc %>%
        mutate(Date=as.Date(Date, format='%d/%m/%Y'), Time=strptime(Time, '%H:%M:%S')) %>%
        filter(Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format='%Y-%m-%d %H:%M:%S')

png(file='plot2.png', width=480, height=480)

plot(hpc$datetime, hpc$Global_active_power, type='l', xlab='', ylab='Global Activer Power (kilowatts)')

#dev.copy(file='plot1.png')

dev.off()
