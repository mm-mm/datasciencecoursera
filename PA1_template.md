Reproducible Research knitr Doc
Peer Assessment #1
======================================================
<!-- rmarkdown v1 -->
(note:  Introduction and Data sections are largely copied from the Coursera assignment web page, with minor appropriate changes to both sections.)

Introduction

It is now possible to collect a large amount of data about personal movement using activity monitoring devices such as a Fitbit, Nike Fuelband, or Jawbone Up. These type of devices are part of the "quantified self" movement - a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. But these data remain under-utilized both because the raw data are hard to obtain and there is a lack of statistical methods and software for processing and interpreting the data.

This document makes use of data from a personal activity monitoring device. This device collects data at 5 minute intervals through out the day. The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012 and include the number of steps taken in 5 minute intervals each day.

Data

The personal activity monitoring data has been downloaded  on 10/17/2014 from the web site:  
    https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip

The following code assumes that the file repdata-data-activity.zip has been unzipped into the user's working directory, into file:  activity.csv

Dataset: Activity monitoring data [52K]
The variables included in this dataset are:
    steps: Number of steps taking in a 5-minute interval (missing values are coded as NA)
    date: The date on which the measurement was taken in YYYY-MM-DD format
    interval: Identifier for the 5-minute interval in which measurement was taken

The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations 
    in this dataset.

Code Chunk #1
Read the file into a dataframe df, initial investigation of df:

```r
setwd("C:/Users/Mark/Desktop")
df <- read.csv("activity.csv")
summary(df)
```

```
##      steps                date          interval     
##  Min.   :  0.00   2012-10-01:  288   Min.   :   0.0  
##  1st Qu.:  0.00   2012-10-02:  288   1st Qu.: 588.8  
##  Median :  0.00   2012-10-03:  288   Median :1177.5  
##  Mean   : 37.38   2012-10-04:  288   Mean   :1177.5  
##  3rd Qu.: 12.00   2012-10-05:  288   3rd Qu.:1766.2  
##  Max.   :806.00   2012-10-06:  288   Max.   :2355.0  
##  NA's   :2304     (Other)   :15840
```

```r
colnames(df)
```

```
## [1] "steps"    "date"     "interval"
```

```r
print("Unique dates in dataset:")
```

```
## [1] "Unique dates in dataset:"
```

```r
unique(df$date)
```

```
##  [1] 2012-10-01 2012-10-02 2012-10-03 2012-10-04 2012-10-05 2012-10-06
##  [7] 2012-10-07 2012-10-08 2012-10-09 2012-10-10 2012-10-11 2012-10-12
## [13] 2012-10-13 2012-10-14 2012-10-15 2012-10-16 2012-10-17 2012-10-18
## [19] 2012-10-19 2012-10-20 2012-10-21 2012-10-22 2012-10-23 2012-10-24
## [25] 2012-10-25 2012-10-26 2012-10-27 2012-10-28 2012-10-29 2012-10-30
## [31] 2012-10-31 2012-11-01 2012-11-02 2012-11-03 2012-11-04 2012-11-05
## [37] 2012-11-06 2012-11-07 2012-11-08 2012-11-09 2012-11-10 2012-11-11
## [43] 2012-11-12 2012-11-13 2012-11-14 2012-11-15 2012-11-16 2012-11-17
## [49] 2012-11-18 2012-11-19 2012-11-20 2012-11-21 2012-11-22 2012-11-23
## [55] 2012-11-24 2012-11-25 2012-11-26 2012-11-27 2012-11-28 2012-11-29
## [61] 2012-11-30
## 61 Levels: 2012-10-01 2012-10-02 2012-10-03 2012-10-04 ... 2012-11-30
```

```r
print("Unique intervals in dataset:")
```

```
## [1] "Unique intervals in dataset:"
```

```r
unique(df$interval)
```

```
##   [1]    0    5   10   15   20   25   30   35   40   45   50   55  100  105
##  [15]  110  115  120  125  130  135  140  145  150  155  200  205  210  215
##  [29]  220  225  230  235  240  245  250  255  300  305  310  315  320  325
##  [43]  330  335  340  345  350  355  400  405  410  415  420  425  430  435
##  [57]  440  445  450  455  500  505  510  515  520  525  530  535  540  545
##  [71]  550  555  600  605  610  615  620  625  630  635  640  645  650  655
##  [85]  700  705  710  715  720  725  730  735  740  745  750  755  800  805
##  [99]  810  815  820  825  830  835  840  845  850  855  900  905  910  915
## [113]  920  925  930  935  940  945  950  955 1000 1005 1010 1015 1020 1025
## [127] 1030 1035 1040 1045 1050 1055 1100 1105 1110 1115 1120 1125 1130 1135
## [141] 1140 1145 1150 1155 1200 1205 1210 1215 1220 1225 1230 1235 1240 1245
## [155] 1250 1255 1300 1305 1310 1315 1320 1325 1330 1335 1340 1345 1350 1355
## [169] 1400 1405 1410 1415 1420 1425 1430 1435 1440 1445 1450 1455 1500 1505
## [183] 1510 1515 1520 1525 1530 1535 1540 1545 1550 1555 1600 1605 1610 1615
## [197] 1620 1625 1630 1635 1640 1645 1650 1655 1700 1705 1710 1715 1720 1725
## [211] 1730 1735 1740 1745 1750 1755 1800 1805 1810 1815 1820 1825 1830 1835
## [225] 1840 1845 1850 1855 1900 1905 1910 1915 1920 1925 1930 1935 1940 1945
## [239] 1950 1955 2000 2005 2010 2015 2020 2025 2030 2035 2040 2045 2050 2055
## [253] 2100 2105 2110 2115 2120 2125 2130 2135 2140 2145 2150 2155 2200 2205
## [267] 2210 2215 2220 2225 2230 2235 2240 2245 2250 2255 2300 2305 2310 2315
## [281] 2320 2325 2330 2335 2340 2345 2350 2355
```

```r
print("Length of Unique intervals in dataset:")
```

```
## [1] "Length of Unique intervals in dataset:"
```

```r
length(unique(df$interval))
```

```
## [1] 288
```

```r
print("Equals the expected number of unique intervals in a day:")
```

```
## [1] "Equals the expected number of unique intervals in a day:"
```

```r
24*60/5
```

```
## [1] 288
```

Check Data as Read In:  

df contains 3 columns:  steps, date, and interval.  df has 17568 rows.  Each row represents one data measurement, thus df is tidy.  

Cleanliness of data:
The column steps contains 2304 NA's.  This is about 20% of the data, so filling non-NA values may change the statistics of the dataset.  Please note that the interval column contains zero NA's.

There are 61 unique dates in df's date column (df$date), corresponding to the 61 dates from 10-1-2012 to 11-30-2012.  These dates are read into df as factors representing dates in the YYYY-MM-DD format.  Thus, there are no missing values or unexpected (or non-date) factors in this column.

The interval column contains integers which represent times through a day, in the HHMM format where HH (hours) is a 24 hour number, and MM is minutes from 0 to 55 in 5 minute increments.  A quick examination of the unique values shows they are all in the expected format.  Note that the integer representation means that the zero hour is not front-filled with zeros, and that similarly single digit hours are not front filled with an extra zero.

It is worth noting that the number of unique interval values equals 288.  This number is equal to 24 x 60/5, the number of expected intervals in a day.  Therefore, there are no unexpected interval values.  Finally, the number of rows (17658) is equal to the number of days (61) times the number of intervals per day (288).  Thus, the dataset number of rows is consistent with what one should expect, so there are no missing or extra dates and intervals.

In summary, other than the NA's in the steps column, the data is clean and neat.  The dataset is tidy.

Code Chunk #2
Plot a histogram of steps per day.  
Compute the mean and the median of steps per day.

```r
df2 <- aggregate(steps~date,df,sum)
hist(df2$steps,breaks=10,
     xlab="Total Steps taken each Day", 
     main="Activity Data (2 months), 
     \n Histogram of Steps per Day, Ignoring NA's")
```

![plot of chunk plot sums of steps in each day](figure/plot sums of steps in each day-1.png) 

```r
print("Mean of steps per day:")
```

```
## [1] "Mean of steps per day:"
```

```r
mean(df2$steps)
```

```
## [1] 10766.19
```

```r
print("Median of steps per day:")
```

```
## [1] "Median of steps per day:"
```

```r
median(df2$steps)
```

```
## [1] 10765
```

Code Chunk 2 simply aggregates (sums) the number of steps in each day, and the histogram of that is plotted.  For simplicity, a new dataframe df2 contains this information.  The mean and median of the total steps per day has been computed:  the mean = 10766.19, the median = 10765.

Please note that by ignoring NA's, there are only 53 days represented in this histogram from the 61 calendar days of the study.


Code Chunk 3:
Plot the average daily activity pattern.
Determine which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps.

```r
df3 <- aggregate(steps~interval,df,mean)
temp <- formatC(df3$interval, width=4, format="d", flag="0")
df3$interval <- temp
plot(df3$interval,df3$steps,
     xlab="Time Interval (5 min)", 
     ylab="Steps per Time Interval (average)",
     main="Activity Data (2 months), \n 
     Steps per 5 Minute Interval (avg each day)",type="l")
```

![plot of chunk plot daily pattern of steps](figure/plot daily pattern of steps-1.png) 

```r
print("The maximum number of steps (avg per day) in an interval is:")
```

```
## [1] "The maximum number of steps (avg per day) in an interval is:"
```

```r
df3[df3$steps==max(df3$steps),]
```

```
##     interval    steps
## 104     0835 206.1698
```

The plot of activity versus 5-minute time interrval shows near-zero activity until about 5am, after which activity picks up and reaches a maximum near 8:30am.  Activity slows down but picks up during lunch hour, and again picks up at 5pm, with a second spike around 7pm (likely corresponding to people leaving work and working out or walking).  Activity tapers off toward zero by 11pm.

The maximum value of steps occurs during the 8:35-8:40am interval.  The maximum value for steps is 206.17 (rounded).


Imputing NA values in steps data
 
As noted above, the only NA values in the dataset (as read from the datafile activity.csv) are in the steps column.  There are 2304 NA values in the steps column.  It is worth pointing out that the NA's appear to correspond to missing days of data.  We have seen already that ignoring NA's resulted in 8 missing days of data (for total steps per day), since 53 days of (total steps per day) data resulted from the original 61 days of dataframe information.  Furthermore, we can see that 2304/288 = 8, where the significance of the numbers are:  (1) 288 is the number of time intervals per day, 8 days is the missing days from NA data, and 2304 is the total number of NA values in the steps column.  Therefore, all of the NA missing values are in 8 separate days.

Code Chunk #4:
Plot the raw data to show missing data (NA's) in separate days.

```r
print("The number of NA's in the steps column of the original dataframe is:")
```

```
## [1] "The number of NA's in the steps column of the original dataframe is:"
```

```r
sum(is.na(df$steps))
```

```
## [1] 2304
```

```r
plot(df$date,df$steps,
     xlab="Date",
     ylab="Steps per 5-min Interval",
     main="Activity Data (Raw) showing Missing Days: \n 
     Steps vs Date for each 5 Minute Interval")
```

![plot of chunk plot raw data to show missing days of steps data](figure/plot raw data to show missing days of steps data-1.png) 
A simple plot of raw data shows the missing days as gaps.  The plot shows that the daily distributions are fairly flat over the measurement dates.  Thus, it is appropriate to replace the NA values with the average daily values, as computed and plotted above.  

Since the missing data (NA's) is grouped as entire days of missing data, it is reasonable to insert the daily interval step averages (averaged out over the 53 measured days), as plotted above.  In summary, the strategy consists of inserting new values which are the mean for that 5-minute interval.  The new dataset is dfnew.  The plot for dfnew is similar to that of the raw data, with missing days now containing data.  

Code Chunk #5:
Plot the new dataframe which now exhibits zero NA's in the steps column.  

```r
dfnew <- df
#dfnew is the original dataframe df which will have imputed values replacing NA's
for(num in 1:nrow(dfnew)) { 
    if(is.na(dfnew$steps[num])) {
        d3<- ((num-1)%%288)+1
        dfnew$steps[num]<-df3$steps[d3] 
    } 
} 
plot(dfnew$date,dfnew$steps,
    xlab="Date",
    ylab="Steps per 5-min Interval",
    main="Activity Data, Missing Data Imputed: 
    \n Steps vs Date for each 5 Minute Interval")
```

![plot of chunk fill in missing data and plot](figure/fill in missing data and plot-1.png) 

```r
print("The number of NA's in the new dataset (with imputed values) is:")
```

```
## [1] "The number of NA's in the new dataset (with imputed values) is:"
```

```r
sum(is.na(dfnew$steps))
```

```
## [1] 0
```

The number of NA's in the steps column of the new dataframe (dfnew) is zero.


Code Chunk 6:
Plot the histogram for the new dataframe.

```r
dfnew2 <- aggregate(steps~date,dfnew,sum)
hist(dfnew2$steps,breaks=10,
     xlab="Total Steps taken each Day", 
     main="Activity Data (2 months), Histogram of Steps per Day, \n 
     New Dataframe:  NA's replaced by Interval Averages")
```

![plot of chunk new dataframe:  plot sums of steps in each day](figure/new dataframe:  plot sums of steps in each day-1.png) 

```r
print("Mean of steps per day:")
```

```
## [1] "Mean of steps per day:"
```

```r
mean(dfnew2$steps)
```

```
## [1] 10766.19
```

```r
print("Median of steps per day:")
```

```
## [1] "Median of steps per day:"
```

```r
median(dfnew2$steps)
```

```
## [1] 10766.19
```

The histogram shows a larger bar at the center position.  This corresponds to adding eight averaged days into the dataframe.  Thus the center (highest) bar is eight units higher in this plot for the new dataframe.

The mean steps per day of the new dataframe is 10766.19.  This is exactly the same value as computed previously for the dataframe where NA's were ignored.  This result is expected, since we have replaced NA's with the averages per 5-minute interval, thus we have replaced the missing days with average days.

The median value of steps per day in the new dataframe is 10766.19.  Previously, for the original dataframe with NA's ignored, the median value was 10765.  However, by filling in the middle with eight non-integer values, we end up with a non-integer median which equals the mean. 

In summary, the strategy for imputing values employed here (replacing NA's with the mean for 5-minute intervals) does not change the mean of total steps per day, but does change the median of total steps per day (slightly).  


We can explore the activity trends comparing weekdays and weekends.  Does the daily activity average differ for weekdays and weekends?  To answer this question, the data will be separated by the "weekday" and "weekend" factor, then plotted.  We will use the new dataframe for which NA's have been replaced by 5-min interval averages.




Code Chunk 7
Plot the daily activity trends separately for weekdays and weekends.

```r
#create weekend-weekday factor
tempdat <- as.POSIXlt(dfnew$date,format="%Y-%m-%d")
tempdat2 <- tempdat$wday
Mon_Fri <- as.logical(tempdat2%%6)
dfnew <- cbind(dfnew,Mon_Fri)

#aggregate, compute means for intervals and weekend-weekday factor
dfnew3 <- aggregate(steps~interval+Mon_Fri,dfnew,mean)
#smooths out x axis...

par(mfrow=c(1,2))
plot(dfnew3$interval[289:576],dfnew3$steps[289:576],
     xlab="Time Interval (5 min)", 
     ylab="Steps per Time Interval (average)",
     main="Mon-Fri Activity Data, \n 
     Steps per 5-min Interval",type="l")
plot(dfnew3$interval[1:288],dfnew3$steps[1:288],
     xlab="Time Interval (5 min)", 
     ylab="Steps per Time Interval (average)",
     main="Sat-Sun Activity Data, \n 
     Steps per 5 Minute Interval",type="l")
```

![plot of chunk weekdays and weekends: plot daily pattern of steps](figure/weekdays and weekends: plot daily pattern of steps-1.png) 

Comparing the plots of Mon-Fri and Sat-Sun steps activity data, we can see that the highest peak of activity during the week is in the morning around 8:30am.  After about 10am, the steps taken in subsequent weekday intervals is much lower.  In contrast, even though the weekend steps activity also shows a morning peak, the activity through the remainder of the day is at about the same level as in the morning.
