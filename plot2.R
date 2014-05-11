plot2<-function (){
  
  ## Dowload the file and unzip
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
  unzip("household_power_consumption.zip")
  ## read the file
  print ("Reading household_power_consumption.txt file... ")
  power_cons_df=read.csv("household_power_consumption.txt", na.string="?", sep=";")
  print ("Done")
  ## convert from Factor to Date
  print("Converting to Date type")
  power_cons_df$Date=as.Date(power_cons_df$Date, format="%d/%m/%Y")
  print ("Done")
  ## find the subset required by the task
  power_cons_subset_df=power_cons_df[power_cons_df$Date >="2007-02-01" & power_cons_df$Date <="2007-02-02",]
  ## print a histogram
  plot(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S")   , power_cons_subset_df$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
  print ("plot2 complete")
 
}

plot2()