plot5 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  
  MDROAD <- subset(NEI,fips=="24510" & type =="ON-ROAD")
  MDROADAGG <- aggregate(MDROAD[,'Emissions'],by=list(MDROAD$year),sum)
  colnames(MDROADAGG) <- c('year','Emissions')
  
  library("ggplot2")
  png(file="plot5.png")
    
  gplot5 <- ggplot(MDROADAGG,aes(factor(year),Emissions))+
  geom_bar(stat="identity",aes(fill=year))+
  labs(x="Year", y="Motor Vehicle Emissions Baltimore City") 
  
  print(gplot5)
  
  rm(MDROADAGG)
  rm(MDROAD)
  rm(NEI)
  
  dev.off()
  
}



