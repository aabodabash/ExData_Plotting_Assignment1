source("readData.R")

#optinal paramter JustPlot
#True --> just plot the data to cur device "to be used later by plot4"
#False "defualt" --> plot to initiated PNG device and just save it 
plot3 <- function(justPlot = F) {
       
        # getData located on readData.R
        # download/filter/process the data as requested
        # cach the results for better performance
        # optianl paramater refrechCahch
        # True to force reprocess and reload the data
        dt <- getData()
        
        if(!justPlot){
                # initiat graph device as per assignment
                png("plot3.png", width=480, height=480)
        }
        
        plot(dt$timestamp, dt$Sub_metering_1,
             type="l",
             col="black",
             xlab="",
             ylab="Energy Sub Metering")
        
        lines(dt$timestamp, dt$Sub_metering_2, col="red")
        lines(dt$timestamp, dt$Sub_metering_3, col="blue")

        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1)
        if(!justPlot){
                #save the file to the disk by releasing device object
                dev.off()
        }
        
}