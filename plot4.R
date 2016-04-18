plot4 <- function() {
  
  ## Reading the entire data. Remove from the memory after use
  NEI <- readRDS("..\\exdata-data-NEI_data\\summarySCC_PM25.rds")
  SCC <- readRDS("..\\exdata-data-NEI_data\\Source_Classification_Code.rds")
  SCCCOAL <- SCC[grepl("coal", SCC$Short.Name,ignore.case=TRUE),]
  NEISCC <- merge(x=NEI,y=SCCCOAL,by="SCC")
  
  NEISCCSUM <- aggregate(NEISCC[,'Emissions'],by=list(NEISCC$year),sum)
  colnames(NEISCCSUM) <- c("Year","Emissions")
  
  library("ggplot2")
  
  png(file="plot4.png")
  gplot4 <- ggplot(NEISCCSUM,aes(x=Year, y=Emissions))+
  geom_line(aes(group=1, col=Emissions))+
  geom_point(aes(size=2, col=Emissions))+
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5))+ 
  labs(x="Year", y="Coal Combustion Emissions USA") 
 
  print(gplot4)
  
  rm(NEISCCSUM)
  rm(NEISCC)
  rm(SCCCOAL)
  rm(NEI)
  
  dev.off()
  
}



