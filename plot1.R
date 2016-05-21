##This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine
##learning datasets. In particular, we will be using the "Individual household electric power consumption
##Data Set" which I have made available on the course web site:
##Dataset: Electric power consumption [20Mb]
##Description: Measurements of electric power consumption in one household with a one-minute sampling
##rate over a period of almost 4 years. Different electrical quantities and some sub-metering values
##are available.

##Our overall goal here is simply to examine how household energy usage varies over a 2-day period in
##February, 2007. Your task is to reconstruct the following plots below, all of which were constructed
##using the base plotting system. 


setwd("C:/Users/Ejiroghene/Desktop/DataScience/COURSES/Exploratory Data Analysis")             

pathToData <- "C:/Users/Ejiroghene/Desktop/DataScience/COURSES/Exploratory Data Analysis/household_power_consumption.txt"             

dataLines <- readLines(pathToData) 
head(dataLines,2) ## display the first two lines of the data including its variables to see how the texts are separated



## Noticed from the last code that the tsext are separated with semi colon(;), therefore the read.csv2 will
##be used to the data into R 



powerConsumptionData <- read.csv2(pathToData, header = TRUE, stringsAsFactors = FALSE)





##Merge the strings of the Date and Time variables using paste() to concatenate them, 
##and assign it to a new vatriable 'DateTime'.

powerConsumptionData$DateTime <- paste(powerConsumptionData$Date, powerConsumptionData$Time)



## Convert the merged Date and Time varibles to DateTime class using as.POSIXct function representing 
##calender dates and times.

powerConsumptionData$DateTime <- as.POSIXct(powerConsumptionData$DateTime, format = "%d/%m/%Y %H:%M:%S")




##Convert the rest variables to numeric because you can't plot graphs with character types

powerConsumptionData$Global_active_power <- as.numeric(powerConsumptionData$Global_active_power)

powerConsumptionData$Global_reactive_power <- as.numeric(powerConsumptionData$Global_reactive_power)

powerConsumptionData$Voltage <- as.numeric(powerConsumptionData$Voltage)

powerConsumptionData$Global_intensity <- as.numeric(powerConsumptionData$Global_intensity)

powerConsumptionData$Sub_metering_1 <- as.numeric(powerConsumptionData$Sub_metering_1)

powerConsumptionData$Sub_metering_2 <- as.numeric(powerConsumptionData$Sub_metering_2)

powerConsumptionData$Sub_metering_3 <- as.numeric(powerConsumptionData$Sub_metering_3)



##Extract Only data corresponding to 2007-02-01 or 2007-02-02


pattern <- "2007-02-01|2007-02-02" ## Gives specific dates to be searched for

DataFeb <- grep(pattern, powerConsumptionData$DateTime)## Gives the indexes ie the positions where 2007-02-01/2007-02-02 exist in the Date column.
PowerDataFeb <- powerConsumptionData[DataFeb, ] 


##Plot a histogram of the "Global_active_power" variable and save it as plot1.png

##Firstly, call the png device u wish to save the file in before plotting

png(filename = "plot1.png", width=480, height=480)


##Secondly, Plot a histogram of the "Global_active_power" variable

hist(PowerDataFeb$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

##Thirdly, turn off the device

dev.off()
