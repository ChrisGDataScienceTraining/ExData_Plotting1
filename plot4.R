plot4<-function (){
  
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
  
  par(mfcol=c(2,2))
  
  plot(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S")   , power_cons_subset_df$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S")   , power_cons_subset_df$Sub_metering_1 , type="l", col="black", ann=FALSE)
  lines(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S")   , power_cons_subset_df$Sub_metering_2 , type="l",  col="red")
  lines(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S")   , power_cons_subset_df$Sub_metering_3 , type="l", col="blue")
  title( ylab="Energy sub metering" )
  legend("topright"  , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lwd=c(1, 1, 1), col=c("black", "red", "blue") )
  
  
  plot(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S"), power_cons_subset_df$Voltage, type="l", ylab="Voltage" , xlab="datetime"  )
  
  plot(strptime(paste(power_cons_subset_df$Date, power_cons_subset_df$Time), "%Y-%m-%d %H:%M:%S"), power_cons_subset_df$Global_reactive_power, type="l"  , ylab="Global_reactive_power" , xlab="datetime")
  
  print ("plot4 complete")
  
}

plot4()