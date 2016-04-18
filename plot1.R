plot1 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  
  EmmiYearTotals <-aggregate(Emissions~year,NEI,sum)
  png(file="plot1.png")
  with(EmmiYearTotals, barplot(Emissions, names.arg=year, xlab='Year',ylab='PM2.5 Emissions', col='green'))
  
  rm(NEI)
  dev.off()
  
}