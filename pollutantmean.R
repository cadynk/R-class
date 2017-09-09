pollutantmean <- function (directory, pollutant, id = 1:332){
        # get the list of files in the 'spec data' folder as characters
        files_list <- paste(getwd(),"/Coursera/",directory,"/",sep = "")
        all_files <- list.files(files_list)
        # vector to store mean values in each file
        result <- numeric(0)
        for (i in id) {
                current_file <- read.csv(file = paste(files_list,all_files[i],sep = ""), header = TRUE, sep = ",")
                values <- na.omit(current_file[[pollutant]])
                result <- c(result, values)
        }
        mean(result)
        
}