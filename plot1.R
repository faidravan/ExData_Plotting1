#Reading the Data Frame
Data<-read.csv("C:/Users/Φαιδρα/Documents/household_power_consumption.txt", sep = ';')

#Extracting the rows of interest
myData <- subset(Data, Date == "1/2/2007")
myData2 <- subset(Data, Date == "2/2/2007")
DataFeb<-rbind(myData,myData2)

#Making the plot
hist(as.numeric(DataFeb$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "darkgoldenrod2")

#Saving the plot

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

