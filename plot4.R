plot4 <- function() {
    selected_data_file <- 'data/household_power_consumption_selected.csv'
    data <- read.csv(selected_data_file)
    data$DateTime <- strptime(paste(data$Date, data$Time),
                              format = '%Y-%m-%d %H:%M:%S')

    plot_width <- 480
    plot_height <- 480
    plot_filename <- 'plot4.png'

    png(filename = plot_filename, width = plot_width, height = plot_height,
        units = "px")

    par(mfrow = c(2,2))
    # Plot 1
    with(data, plot(DateTime, Global_active_power, type = 'l', main = '',
                    xlab = '', ylab = 'Global Active Power'))
    # Plot 2
    with(data, plot(DateTime, Voltage, type = 'l', xlab = 'datetime',
                    ylab = 'Voltage'))
    # Plot 3
    with(data, plot(DateTime, Sub_metering_1, type = 'l', col = 'black',
                    ylab = 'Energy sub metering', xlab = ''))
    with(data, lines(DateTime, Sub_metering_2, col = 'red'))
    with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
    legend(x = 'topright',
           legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), lty = 1, bty = 'n')
    # Plot 4
    with(data, plot(DateTime, Global_reactive_power, type = 'l', main = '',
                    xlab = 'datetime'))

    dev.off()
}
