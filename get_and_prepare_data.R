# Downloads household_power_consumption and saves the data between start_date and
# end_date (inclusive) to household_power_consumption_subset.csv
get_and_prepare_data <- function(start_date=as.Date('2007-02-01'),
                                 end_date=as.Date('2007-02-02'))

    data_download_link <- paste(
        'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F',
        'household_power_consumption.zip', sep='')
    data_zip_file <- 'household_power_consumption.zip'
    full_data_file <- 'household_power_consumption.txt'
    selected_data_file <- 'household_power_consumption_selected.csv'

    dir.create('data', showWarnings = FALSE)
    setwd('data')
    download.file(data_download_link, data_zip_file, mode="wb")
    unzip(data_zip_file, c(full_data_file))

    data <- read.table(full_data_file, header = TRUE, sep = ';')
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")

    selected_data <- data[data$Date >= start_date & data$Date <= end_date, ]
    write.csv(selected_data, selected_data_file, quote = FALSE,
              row.names = FALSE)
