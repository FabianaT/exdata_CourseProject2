## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Look for coal combustion-related sources:

SCCCoal <- SCC[grep("Coal", SCC$EI.Sector), c("SCC", "EI.Sector")]
NEICoal <- merge(NEI, SCCCoal, by="SCC")

## Plotting

library(ggplot2)

g <- ggplot(NEICoal, aes(year, Emissions))
g <- g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
g <- g + labs(title = "Emissions from coal combustion-related sources") + labs(x = "Year", y = "Emissions")

print(g)

dev.copy(png, file = "plot4.png", width = 600, height = 600)
dev.off()