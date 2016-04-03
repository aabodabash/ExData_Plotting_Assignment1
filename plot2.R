source("readData.R")

plot2 <- function() {
       
        # getData located on readData.R
        # download/filter/process the data as requested
        # cach the results for better performance
        # optianl paramater refrechCahch
        # True to force reprocess and reload the data
        dt <- getData()
        
        # initiat graph device as per assignment
        png("plot2.png", width=480, height=480)
        
        
        plot(dt$timestamp, dt$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power (kilowatts)")
        
        dev.off()
}