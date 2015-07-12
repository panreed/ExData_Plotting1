## The first part of the code loads the data into a data frame called my_data by subsetting
## the original data frame, which for the case here, results in a data frame with 
## 2880 rows and 9 varibles

test1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- test1[test1[,1]== "1/2/2007"|test1[,1]=="2/2/2007",]

## This part generate the time code for using as x-axis in the plot
time_data <- paste(my_data$Date, my_data$Time, sep = " ")
time_real <- strptime(time_data, "%d/%m/%Y %H:%M:%S")

## This part extract the relevant data and converts them into numeric format
global_active_power_data <- as.character(my_data[,3])
global_active_power <- as.numeric(global_active_power_data)
sm1 <- as.numeric(as.character(my_data[,7]))
sm2 <- as.numeric(as.character(my_data[,8]))
sm3 <- as.numeric(as.character(my_data[,9]))
global_reactive_power <- as.numeric(as.character(my_data[,4]))
voltage <- as.numeric(as.character(my_data[,5]))

## Here I make the plot
par(mfrow=c(2,2), mar = c(4,4,2,2))
plot(time_real,global_active_power, type = "l", xlab = "", ylab = "Global Active Power",cex.axis=0.75, cex.lab=0.75)
plot(time_real,voltage, type = "l", xlab = "datetime", ylab = "Voltage",cex.axis=0.75, cex.lab=0.75)
plot(time_real, sm1, type= "l",xlab = "", ylab = "Energy sub metering",cex.axis=0.75, cex.lab=0.75)
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), y.intersp=0.5, bty = "n", cex = 0.65)
lines(time_real,sm2, col="red")
lines(time_real,sm3, col="blue")
plot(time_real,global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power",cex.axis=0.75, cex.lab=0.75)

## Here I write the plot to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

