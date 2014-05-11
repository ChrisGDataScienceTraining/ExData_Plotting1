plot1<-function (){
  
  ## Dowload the file and unzip
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
  unzip("household_power_consumption.zip")
  ## read the file
  power_cons_df=read.csv("household_power_consumption.txt", na.string="?", sep=";")
  ## convert from Factor to Date
  power_cons_df$Date=as.Date(power_cons_df$Date, format="%d/%m/%Y")
  ## find the subset required by the task
  power_cons_subset_df=power_cons_df[power_cons_df$Date >="2007-02-01" & power_cons_df$Date <="2007-02-02",]
  ## print a histogram
  hist(subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
}

plot1()