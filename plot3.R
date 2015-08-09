## Exploratory Data Analysis - Week one assignment: Plotting (third plot)
#
## plot3.R - will generate plot3.png
# Download the data set from UC Irvine Machine Learning Repository (see link in README.md file)
# Don't forget to set your working directory to where the data file is located
## Don't forget to UNZIP the file (should be "household_power_consumption.txt")

# Read in the data from the text file:
## Reading the data from the contents of the zipped file
powerdata<- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", colClasses = c("character", "character", 
                                               rep("numeric",7)), na.strings="?")

#convert Date column to date-format (from Character)
powerdata$Date <-as.Date(powerdata$Date, format = "%d/%m/%Y") 
##subset only the data of interest (for the two dates Feb 1& 2 of 2007)
dataofinterest <- powerdata[(powerdata$Date == "2007-02-01") | (powerdata$Date =="2007-02-02"), ]

#make a new column with date and time in one column
dataofinterest$datetime <-paste(dataofinterest$Date, dataofinterest$Time, collapse = NULL, sep = ' ')

# convert the character data to POSIXct data and bind to existing data
dataofinterest$datetime <- strptime(dataofinterest$datetime, format="%Y-%m-%d %H:%M:%S", tz="UTC")

## now let's make the plot 3:
png(filename="plot3.png", width=480, height=480)
plot(dataofinterest$datetime, dataofinterest$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(dataofinterest$datetime,dataofinterest$Sub_metering_2,col="red")
lines(dataofinterest$datetime,dataofinterest$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lwd=par("lwd"))
dev.off()
