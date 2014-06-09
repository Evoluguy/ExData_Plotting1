
## Source data (household_power_consumption.txt) should be in the data directory of the current working directory where the R script is.

rawfile <- file("./data/household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="./data/filtered.txt")
close(rawfile)

Filtered_data <- read.table("./data/filtered.txt",header=TRUE,sep=";"
                            ,na.strings="?",stringsAsFactors=FALSE)

hist(Filtered_data$Global_active_power,xlab="Global Active Power(kilowatts)",col='RED',main = "Global Active Power")

dev.copy(png,filename="plot1.png")
dev.off()