plot2 <- function() {
    selected_data_file <- 'data/household_power_consumption_selected.csv'
    data <- read.csv(selected_data_file)
    data$DateTime <- strptime(paste(data$Date, data$Time),
                              format = '%Y-%m-%d %H:%M:%S')

    plot_width <- 480
    plot_height <- 480
    plot_filename <- 'plot2.png'

    png(filename = plot_filename, width = plot_width, height = plot_height,
        units = "px")

    with(data, plot(DateTime, Global_active_power, type = 'l',
                    ylab = 'Global Active Power (kilowatts)', xlab = ''))

    dev.off()
}
