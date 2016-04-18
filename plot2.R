plot2 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  MDNEI <- subset(NEI, fips=="24510")
  
  BaltCityTotals <-aggregate(Emissions~year,MDNEI,sum)
  png(file="plot2.png")
  with(BaltCityTotals, barplot(Emissions, names.arg=year, xlab='Year',ylab='PM2.5 Emissions Baltimore', col='green'))
  
  rm(MDNEI)
  rm(NEI)
  
  dev.off()
  
  
}



