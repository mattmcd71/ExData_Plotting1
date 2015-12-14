library(dplyr)

hpc <- read.table('household_power_consumption.txt', sep=";", header=TRUE, na.strings = '?')

hpc <- hpc %>%
        mutate(Date=as.Date(Date, format='%d/%m/%Y')) %>%
        filter(Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))

png(file='plot1.png', width=480, height=480)

hist(hpc$Global_active_power, xlab = 'Global Active Power (kilowatts)', col='red', main='Global Active Power')

#dev.copy(file='plot1.png')

dev.off()

