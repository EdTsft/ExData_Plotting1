plot3 <- function() {
    selected_data_file <- 'data/household_power_consumption_selected.csv'
    data <- read.csv(selected_data_file)
    data$DateTime <- strptime(paste(data$Date, data$Time),
                              format = '%Y-%m-%d %H:%M:%S')

    plot_width <- 480
    plot_height <- 480
    plot_filename <- 'plot3.png'

    png(filename = plot_filename, width = plot_width, height = plot_height,
        units = "px")

    with(data, plot(DateTime, Sub_metering_1, type = 'l', col = 'black',
                    ylab = 'Energy sub metering', xlab = ''))
    with(data, lines(DateTime, Sub_metering_2, col = 'red'))
    with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
    legend(x = 'topright',
           legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), lty = 1)

    dev.off()
}
