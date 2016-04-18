plot6 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  
  MDROAD <- subset(NEI,fips=="24510" & type =="ON-ROAD")
  MDROADAGG <- aggregate(MDROAD[,'Emissions'],by=list(MDROAD$year),sum)
  colnames(MDROADAGG) <- c('year','Emissions')
  MDROADAGG$City <- "Baltimore City"
  
  LAROAD <- subset(NEI,fips=="06037" & type =="ON-ROAD")
  LAROADAGG <- aggregate(LAROAD[,'Emissions'],by=list(LAROAD$year),sum)
  colnames(LAROADAGG) <- c('year','Emissions')
  LAROADAGG$City <- "Los Angeles County"
  
  COMBINEDDF <- rbind(MDROADAGG,LAROADAGG)
  
  library("ggplot2")
  png(file="plot6.png")
  
 
  gplot6 <- ggplot(COMBINEDDF,aes(factor(year),Emissions,fill=City))+
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(.~City)+
  labs(x="Year", y="Emissions")
  
  print(gplot6)
  
  rm(MDROADAGG)
  rm(MDROAD)
  rm(LAROADAGG)
  rm(LAROAD)
  rm(COMBINEDDF)
  rm(NEI)
  
  dev.off()
  
}



