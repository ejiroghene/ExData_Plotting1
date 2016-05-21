##Plot a graph that shows the  energy sub metering 1, 2, 3  in different colors 
##and with legend for the two days in February..

##Firstly, call the png device u wish to save the file in before plotting

png(filename = "plot3.png", width=480, height=480)


##Secondly, Plot a graph that shows the  energy sub metering 1, 2, 3 in relation to the two days stated

##Plot sub metering_1 in relation to the two days stated

plot(PowerDataFeb$DateTime, PowerDataFeb$Sub_metering_1, type = "l",  xlab = "", ylab = "Energy sub metering") 

##Add/annotate the graph with points for sub metering2

points(PowerDataFeb$DateTime, PowerDataFeb$Sub_metering_2, type = "l", col= "red")

##Add/annotate the graph with points for sub metering3

points(PowerDataFeb$DateTime, PowerDataFeb$Sub_metering_3, type = "l", col= "blue")

##Add legend to the graph

legend("topright",  lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.75,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##NOTE lty=line type = 1 ie straight line; col = color; cex= size of the legend;etc


##Thirdly, turn off the device

dev.off()

