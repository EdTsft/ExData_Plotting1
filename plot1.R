plot1 <- function() {
    selected_data_file <- 'data/household_power_consumption_selected.csv'
    data <- read.csv(selected_data_file)

    plot_width <- 480
    plot_height <- 480
    plot_filename <- 'plot1.png'

    png(filename = plot_filename, width = plot_width, height = plot_height,
        units = "px")

    with(data, hist(Global_active_power, col = 'red',
                    main = 'Global Active Power',
                    xlab = 'Global Active Power (kilowatts)'))

    dev.off()
}
