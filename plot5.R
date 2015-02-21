## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Look for motor vehicle sources sources:

SCCMotorVehicles <- SCC[grep("Vehicle", SCC$EI.Sector), c("SCC", "EI.Sector")]
NEIMotorVehicles <- merge(NEI, SCCMotorVehicles, by="SCC")

## Keep only info from Baltimore City:
NEIMotorVehicles <- subset(NEIMotorVehicles, NEIMotorVehicles$fips == "24510")

## Plotting

library(ggplot2)

g <- ggplot(NEIMotorVehicles, aes(year, Emissions))
g <- g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
g <- g + labs(title = "Emissions from motor vehicle sources at Baltimore City") + labs(x = "Year", y = "Emissions")

print(g)

dev.copy(png, file = "plot5.png", width = 600, height = 600)
dev.off()