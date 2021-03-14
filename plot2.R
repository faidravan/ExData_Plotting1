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

plot(y = as.numeric(DataFeb$Global_active_power), x = DataFeb$ExactTime, type = "l", xlab = "", ylab = "Global Active Power (in kilowatts)", col = "darkgoldenrod2")

#Saving the plot

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()