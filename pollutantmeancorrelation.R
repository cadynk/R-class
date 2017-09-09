corr <- function (directory, threshold = 0){
        files <- paste(getwd(),"/Coursera/",directory,"/",sep = "")
        listoffiles <- list.files(files)
        result <- numeric(0)
        for (i in listoffiles) {
                current_file <- read.csv(file = paste(files,i,sep = ""),header = TRUE,sep = ",")
                threshold_test <- as.numeric(sum(complete.cases(current_file)))
                if (threshold_test > threshold)
                        x <- na.omit(current_file[,2:3])
                        sulfate_value <- x[,1]
                        nitrate_value <- x[,2]
                        corrrr <- cor(sulfate_value,nitrate_value)
                        result <- c(result, corrrr)
        }
        result
}
