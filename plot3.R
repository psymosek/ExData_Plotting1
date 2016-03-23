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
# Plot the three variable Sub_metering_1, Sub_metering_2 and Sub_metering_3 as an overlaid
# line plot
png("plot3.png")
yrange<-range(hpc$Sub_metering_1)
plot(time,hpc$Sub_metering_1,type="l",col="black",ylab="Energy Sub Metering",ylim=yrange,
     xlab="")
par(new=TRUE)
plot(time,hpc$Sub_metering_2,type="l",col="red",axes=FALSE,ylim=yrange,ylab="",xlab="")
par(new=TRUE)
plot(time,hpc$Sub_metering_3,type="l",col="blue",axes=FALSE,ylim=yrange,xlab="",ylab="")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


