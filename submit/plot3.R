#setwd() <- not showing on github for security purposes 
filename<-"household_power_consumption.txt"
data<-read.table(filename,sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)

#Preparing data to make a date/time var
Dates<- data$Date 
Times<-data$Time
x<-paste(Dates,Times) #Pasting date and time together in one var to run through striptime 
data$d_t<-strptime(x, "%d/%m/%Y %T")

#Subsetting for dates we want
start<-"2007-02-01 00:00:00"
end<- "2007-02-03 00:00:00"
dataUse<-subset(data,data$d_t >= start & data$d_t <= end)


png("./exdata_plotting1/submit/plot3.png",height = 480, width = 480)
plot(dataUse$d_t,dataUse$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(dataUse$d_t,dataUse$Sub_metering_2,col="red")
lines(dataUse$d_t,dataUse$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
