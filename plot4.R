library("data.table")
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
hpc<-fread("household_power_consumption.txt",header=TRUE,nrows=0)
colNames<-names(hpc)
hpc<-fread("household_power_consumption.txt",na.strings="?",
           colClasses=c("character","character","numeric","numeric","numeric",
                        "numeric","numeric","numeric","numeric"),sep=";",
           header=FALSE,skip="1/2/2007",nrows=2880)
colnames(hpc)<-colNames
time<-strptime(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S")
png("plot4.png")
yrange<-range(hpc$Sub_metering_1)
par(mfrow=c(2,2),mar=c(5,5,1,1),oma=c(0,0,0,0))
plot(time,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(time,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(time,hpc$Sub_metering_1,type="l",col="black",ylab="Energy Sub Metering",ylim=yrange,
     xlab="")
par(new=TRUE)
plot(time,hpc$Sub_metering_2,type="l",col="red",axes=FALSE,ylim=yrange,ylab="",xlab="")
par(new=TRUE)
plot(time,hpc$Sub_metering_3,type="l",col="blue",axes=FALSE,ylim=yrange,xlab="",ylab="")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty="n",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(time,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()


