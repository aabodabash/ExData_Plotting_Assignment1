source("readData.R")

plot1 <- function(data=NULL) {
       
        
        # getData located on readData.R
        # download/filter/process the data as requested
        # cach the results for better performance
        # optianl paramater refrechCahch
        # True to force reprocess and reload the data
        dt <- getData()
        
       
        # initiat graph device as per assignment
        png("plot1.png", width=480, height=480)
        
        hist(dt$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
        dev.off()
}