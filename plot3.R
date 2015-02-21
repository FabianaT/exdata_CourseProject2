## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable...
## Which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
NEIByYearAndType <- group_by(NEI, year, type)
totalEmissions <- summarise(NEIByYearAndType, totalEmissions = sum(Emissions))
colnames(totalEmissions)[2] <- "Type"

g <- ggplot(totalEmissions, aes(year, totalEmissions))
g <- g + geom_point(aes(color = Type), size = 3) + geom_line(aes(color = Type), linetype=2, size = 1)
g <- g + labs(title = "Emissions by source type") + labs(x = "Year", y = "Total Emissions")

print(g)

dev.copy(png, file = "plot3.png", width = 600, height = 600)
dev.off()