rawfile <- file("./data/household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="./data/filtered.txt")
close(rawfile)

Filtered_data <- read.table("./data/filtered.txt",header=TRUE,sep=";"
                            ,na.strings="?",stringsAsFactors=FALSE)

date<-as.Date(na.omit(Filtered_data[,1]),format="%d/%m/%Y")
datetime<-paste(date,Filtered_data[,2])
x<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mar=c(4,4,1,1))
par(mfcol=c(2,2))
y<-na.omit(Filtered_data[,3])
plot(x,y,type="n",xlab="",ylab="Global Active Power(kilowatts)")
lines(x,y,type="l")

#plot 2
sub1<-na.omit(Filtered_data[,7])
sub2<-na.omit(Filtered_data[,8])
sub3<-na.omit(Filtered_data[,9])
plot(x,sub1,type="n",xlab="",ylab="Energy sub metering")
lines(x,sub1,type="l",col="BLACK")
lines(x,sub2,type="l",col="RED")
lines(x,sub3,type="l",col="BLUE")
leg_col<-c("BLACK","RED","BLUE")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=leg_col,lwd=2)

#plot3

plot(x,na.omit(Filtered_data[,5]),xlab="datetime",ylab="Voltage",type="l")

#plot4

plot(x,na.omit(Filtered_data[,4]),xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()