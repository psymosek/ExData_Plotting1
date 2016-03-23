library("data.table")
# read the rows of the text file household_power_consumption.txt corresponding to the
# dates February 1, 2007 and February 2, 2007
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
# store the column names to colNames
hpc<-fread("household_power_consumption.txt",header=TRUE,nrows=0)
colNames<-names(hpc)
# read the measurements corresponding to the appropriate date range
hpc<-fread("household_power_consumption.txt",na.strings="?",
           colClasses=c("character","character","numeric","numeric","numeric",
                        "numeric","numeric","numeric","numeric"),sep=";",
           header=FALSE,skip="1/2/2007",nrows=2880)
colnames(hpc)<-colNames
time<-strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
# Plot the Global_active_power variable
png("plot2.png")
plot(time,hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()


