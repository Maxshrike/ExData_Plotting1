## Exploratory Data Analysis - Week one assignment: Plotting
#
## plot1.R - will generate plot1.png
# Download the data set from UC Irvine Machine Learning Repository (see link in README.md file)
# Don't forget to set your working directory to where the data file is located
## Don't forget to UNZIP the file (should be "household_power_consumption.txt")

# Read in the data from the text file:
housePC<- read.table("household_power_consumption.txt", header = TRUE, 
                          sep = ";", colClasses = c("character", "character", 
                          rep("numeric",7)), na.strings="?")

##convert Date column to the date format usable in R
housePC$Date <-as.Date(housePC$Date, format = "%d/%m/%Y") 

#Now subset the data for the dates specified in the assignment:
datafordates <- housePC[(housePC$Date == "2007-02-01") | (housePC$Date =="2007-02-02"), ]

## Next, make the plot in png format with 480x480 dimensions

png(filename="plot1.png", width=480, height=480)
hist(datafordates$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()