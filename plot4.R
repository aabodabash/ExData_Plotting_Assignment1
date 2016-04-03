source("readData.R")
source("plot3.R")

plot4 <- function() {
       
        # getData located on readData.R
        # download/filter/process the data as requested
        # cach the results for better performance
        # optianl paramater refrechCahch
        # True to force reprocess and reload the data
        dt <- getData()
        
        # initiat graph device as per assignment
        png("plot4.png", width=480, height=480)
        
        # setup graph device layout
        par(mfrow=c(2,2))
        
        #Top Left Graph
        plot(dt$timestamp, dt$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power")
        
        
        #Top Right Graph
        plot(dt$timestamp, dt$Voltage,
             type="l",
             xlab="datetime",
             ylab="Voltage")
        
        
        #Bottom Left Graph
        #just call plot3 and tell it dont render to sperate device
        plot3(T)
        #EOF Bottom Left graph
        
        
        # Bottom Right graph
        plot(dt$timestamp, dt$Global_reactive_power,
             type="n",
             xlab="datetime",
             ylab="Global Reactive power")
        
        lines(dt$timestamp, dt$Global_reactive_power)
        #EOF Bottom Right Graph
        
        #save the file to the disk by releasing device object
        dev.off()
        
}