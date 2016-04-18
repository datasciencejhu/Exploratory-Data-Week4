plot3 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  MDNEI <- subset(NEI, fips=="24510")
  library("ggplot2")
  png(file="plot3.png",width=480,height=480,units="px",bg="transparent")
  gplot3 <- ggplot(MDNEI,aes(factor(year),Emissions,fill=type))+
  geom_bar(stat='identity')+
  facet_grid(.~type)+
  labs(x="Year", y="Emissions Baltimore City")
  
  print(gplot3)
  
  rm(MDNEI)
  rm(NEI)
  
  dev.off()
  
}



