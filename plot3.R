#Reading the Data Frame and setting language in English 

Data<-read.csv("C:/Users/Φαιδρα/Documents/household_power_consumption.txt", stringsAsFactors = F, sep=';')
Sys.setlocale(category = "LC_ALL", locale = "english")

#Extracting the rows of interest

myData <- subset(Data, Date == "1/2/2007")
myData2 <- subset(Data, Date == "2/2/2007")
DataFeb<-rbind(myData,myData2)

#Setting the Date column in the appropriate Date format, and combining it
#with the Time column in the correct format

DataFeb$Date <- as.Date(DataFeb$Date, format="%d/%m/%Y")
DataFeb$ExactTime<-as.POSIXct(paste(DataFeb$Date,DataFeb$Time)) 

#Making the plot 
plot(y = as.numeric(DataFeb$Sub_metering_1), x = DataFeb$ExactTime, type = "l", xlab = "", ylab = "Energy sub metering" , col = "darkred")
lines(y = as.numeric(DataFeb$Sub_metering_2), x = DataFeb$ExactTime, type = "l",  col = "chartreuse4" )
lines(y = as.numeric(DataFeb$Sub_metering_3), x = DataFeb$ExactTime, type = "l",  col = "darkcyan" )
legend("topright", col=c("darkred", "chartreuse4", "darkcyan"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving the plot

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()     