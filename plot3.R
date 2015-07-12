## The first part of the code loads the data into a data frame called my_data by subsetting
## the original data frame, which for the case here, results in a data frame with 
## 2880 rows and 9 varibles

test1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- test1[test1[,1]== "1/2/2007"|test1[,1]=="2/2/2007",]

## This part generate the time code for using as x-axis in the plot
time_data <- paste(my_data$Date, my_data$Time, sep = " ")
time_real <- strptime(time_data, "%d/%m/%Y %H:%M:%S")

## Here I convert the submetering data into numeric 
sm1 <- as.numeric(as.character(my_data[,7]))
sm2 <- as.numeric(as.character(my_data[,8]))
sm3 <- as.numeric(as.character(my_data[,9]))

## Here I make the plot and add the legend
plot(time_real, sm1, type= "l",xlab = "", ylab = "Energy sub metering",cex.axis=0.75, cex.lab=0.75)
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), y.intersp=0.5, cex = 0.65)
lines(time_real,sm2, col="red")
lines(time_real,sm3, col="blue")

## Here I write the plot to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
