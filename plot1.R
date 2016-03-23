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
png("plot1.png")
hist(hpc$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main="Global Active Power",col="red")
dev.off()


