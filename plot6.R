## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Look for motor vehicle sources sources:

SCCMotorVehicles <- SCC[grep("Vehicle", SCC$EI.Sector), c("SCC", "EI.Sector")]
NEIMotorVehicles <- merge(NEI, SCCMotorVehicles, by="SCC")

## Keep only info from Baltimore City and Los Angeles County:
NEIMotorVehicles <- subset(NEIMotorVehicles, NEIMotorVehicles$fips == "24510" | fips == "06037")
NEIMotorVehicles$City[NEIMotorVehicles$fips == "24510"] <- "Baltimore City"
NEIMotorVehicles$City[NEIMotorVehicles$fips == "06037"] <- "Los Angeles County"

## Plotting

library(ggplot2)

g <- ggplot(NEIMotorVehicles, aes(year, Emissions))
g <- g + geom_point(color = "steelblue", size = 4, alpha = 1/2) + facet_grid(.~City)
g <- g + labs(title = "Emissions from motor vehicle sources") + labs(x = "Year", y = "Emissions")

print(g)

dev.copy(png, file = "plot6.png", width = 600, height = 600)
dev.off()