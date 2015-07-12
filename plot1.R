## The first part of the code loads the data into a data frame called my_data by subsetting
## the original data frame, which for the case here, results in a data frame with 
## 2880 rows and 9 varibles

test1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
my_data <- test1[test1[,1]== "1/2/2007"|test1[,1]=="2/2/2007",]

## This part extract the relevant data and converts them into numeric format
global_active_power_data <- as.character(my_data[,3])
global_active_power <- as.numeric(global_active_power_data)

# This part does the plotting
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.main = 0.75, cex.axis=0.75, cex.lab=0.75)

# This part writes to the file in png format
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()