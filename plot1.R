## Project 1, Exploratory Data Analysis/Coursera
#
# data file read from url on 10/7/2014, unzipped into
#   working directory, filename = household_power_consumption.txt
# source url = 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 126Mb file size, .txt file type, (20Mb sip file), 
# more info:  http://archive.ics.uci.edu/ml/
# The dataset has 2,075,259 rows and 9 columns.

# read raw data from file 
filename <- "household_power_consumption.txt"
raw_dat <- read.table(filename,header=TRUE,sep=";")

# SHRINK and CONVERT TO NUMERIC/DATE/TIME
# first, manually shrink the rows:  reduce rows to the dates required (shrink the data!)
#    We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# second, convert the data from factors into useful classes:
#    as read, every item in table raw_dat is a "factor", 
#    so convert to date and time, real numbers, plug in "NA" to replace question marks,
# 
beginfind <- FALSE
endfind <- FALSE
for (i in 1:nrow(raw_dat)){
    if(beginfind==FALSE){
        if (as.character(raw_dat[i,1])=="1/2/2007"){
            beginfind <- TRUE
            startrow <- i
            print(startrow)
        }
    }
    if (beginfind==TRUE & endfind==FALSE){
        if(as.character(raw_dat[i,1])=="3/2/2007"){
            endrow <- i-1
            endfind == TRUE
            break
        }
    }
}
print(endrow)

raw_select <- raw_dat[startrow:endrow,]
sel_rows <- nrow(raw_select)
for (i in 1:2){
    raw_select[,i] <- as.character(raw_select[,i])
}
for (i in 3:9){
    raw_select[,i] <- as.numeric(as.character(raw_select[,i]))
}

#  Plot #1
png(filename="plot1.png")
#creates a plot file in the working directory
hist(raw_select$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     main="Global Active Power",col="red")
dev.off()
