steps <- read.csv(file = paste(getwd(),"/Coursera/repdata%2Fdata%2Factivity/activity.csv",sep = ""),header = TRUE)
View(steps)

stepsbyday <- aggregate(x = steps$steps, by = list(steps$date), FUN = sum, na.rm = TRUE)
hist(x = stepsbyday$x)

mean(stepsbyday$x)
median(stepsbyday$x)
sum(stepsbyday$x)


averagestepsbyday <- aggregate(x = steps$steps,by =list(steps$date), FUN = mean)
View(averagestepsbyday)
plot(averagestepsbyday,type = "l")


findhighest <- max(steps$steps,na.rm = TRUE)
highestinterval <- steps$interval[which(steps$steps==findhighest)]

missingrows <- sum(!complete.cases(steps$steps))

stepsfixed <- steps
averageall <- mean(steps$steps,na.rm = TRUE)
stepsfixed[is.na(steps)] <- averageall

stepsfixedbyday <- aggregate(x = stepsfixed$steps, by = list(stepsfixed$date),FUN = sum, na.rm = TRUE)
hist(x = stepsfixedbyday$x)

mean(stepsfixedbyday$x)
median(stepsfixedbyday$x)
        #imputing the missing values in the steps column raised the mean from 9354.23 to 10766.19. 
        #the histograms between these did not change significantly in my opinion. 
        #I noticed that the "fixed" data looked more normal, 
        #probably becuase I replaced the missing values with the sample mean.s
stepsfixedbydayx <- weekdays(as.Date(stepsfixedbyday$Group.1))
stepsfixedbyday <- mutate(.data = stepsfixedbyday,stepsfixedbydayx)
View(stepsfixedbyday)

stepsfixedbyday$stepsfixedbydayx[stepsfixedbydayx=="Saturday" | stepsfixedbydayx=="Saturday"] <- "Weekend"
stepsfixedbyday$stepsfixedbydayx[!(stepsfixedbydayx=="Saturday" | stepsfixedbydayx=="Saturday")] <- "WeekDay"

averagestepsfixedbyday <- aggregate(x = stepsfixed$steps,by = list(stepsfixed$date), FUN = mean)
averagestepsfixedbyday <- mutate(.data = averagestepsfixedbyday,weekdays(as.Date(averagestepsfixedbyday$Group.1)))
averagestepsfixedbyday <- `colnames<-`(averagestepsfixedbyday,c("Dates","AVGsteps","Days"))
averagestepsfixedbyday$Days[averagestepsfixedbyday$Days=="Saturday" | averagestepsfixedbyday$Days== "Sunda"] <- "Weekend"








