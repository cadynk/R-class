pollutantmean <- function (directory, pollutant, id = 1:332){
        # vector to store mean values in each file
        means <- c()
        for (i in id) {
                current_file <- paste(directory, i, ".csv")
                read.csv(file = current_file, header = TRUE, sep = ",")
                remove_na <- current_file [!is.na(x = current_file[pollutant])]
                means[i] <- mean(remove_na)
        }
}