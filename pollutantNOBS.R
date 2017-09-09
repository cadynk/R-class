complete <- function (directory, id = 1:332){
        files <- paste(getwd(),"/Coursera/",directory,"/",sep = "")
        listoffiles <- list.files(files)
        result <- numeric()
        for (i in id) {
                current_file <- read.csv(file = paste(files,listoffiles[i],sep = ""),header = TRUE,sep = ",")
                values <- c(id, nrow(na.omit(current_file["sulfate"])))
        result <- rbind(result, values)
        }
result
        }
