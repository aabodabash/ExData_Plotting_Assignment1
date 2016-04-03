## load required packages
packages<-c("data.table", "dplyr")
sapply(packages, require, character.only = TRUE)

extURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataRawDir <- "data-raw"

## to cach filtered records
sampleDataDT <- NULL


## Just download/exract Raw data if not exists
getRawData <- function(){
        
        ## tem directory to store downloaded zip file
        ## and to be deleted after extract
        tempFile <- paste(tempdir(),"temp.zip",sep = "\\")
        
        download.file(extURL,destfile = tempFile )
        
        if( !dir.exists(dataRawDir)){
                dir.create(dataRawDir)
        }
        
        listOfFiles <- unzip(tempFile , exdir = dataRawDir)
        sampleDataDT <<- NULL
        unlink(tempFile)
}




## Read Only required files "as per assignment scope"
## Cach filtered records to be used during Exp Analysis
getData <- function(refreshCach = F){
        
        
        
        
        ## check if the raw data exsit
        ## if not download&extract it to data-raw dir
        if( ! dir.exists(dataRawDir)){
                getRawData()  
        }
        
      
        
        if( is.null(sampleDataDT) | refreshCach == T ){
        
        tempDS <- data.table:: fread(input =  file.path(dataRawDir,"household_power_consumption.txt"),
                         na.strings="?",
                         header=T,
                         sep=";",
                        # stringsAsFactors=F, 
                         options(warn=-1),
                         showProgress = F,
                         data.table =F, ## to avoid DT POSIXlt issue
                         colClasses=c("character", "character", rep("numeric",7))) %>% 
                filter(Date %in% c("1/2/2007","2/2/2007")) %>%
                transform( timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S" ) ) %>%
                select(1,10,3:9)
                 
        
        tempDS$Date <- as.Date(tempDS$Date, format = '%m/%d/%Y')
        sampleDataDT <<- tempDS
        
        }
        
        return(sampleDataDT)
}
