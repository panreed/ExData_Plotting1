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

# Here I generate the line plot that is plot 2
plot(time_real,global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",cex.axis=0.75, cex.lab=0.75)

# Now save the plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
