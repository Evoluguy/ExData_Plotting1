
## Source data (household_power_consumption.txt) should be in the data directory of the current working directory where the R script is.

rawfile <- file("./data/household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="./data/filtered.txt")
close(rawfile)

Filtered_data <- read.table("./data/filtered.txt",header=TRUE,sep=";"
                            ,na.strings="?",stringsAsFactors=FALSE)

date<-as.Date(na.omit(Filtered_data[,1]),format="%d/%m/%Y")
datetime<-paste(date,Filtered_data[,2])
x<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
y<-na.omit(Filtered_data[,3])
plot(x,y,type="n",xlab="",ylab="Global Active Power(kilowatts)")
lines(x,y,type="l")
dev.copy(png,filename="plot2.png")
dev.off()
