## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## YES!

NEI <- readRDS("summarySCC_PM25.rds")
NEIBaltimore <- subset(NEI, NEI$fips == "24510")

NEIBaltimoreByYear <- group_by(NEIBaltimore, year)
BaltimoreTotalEmissions <- summarise(NEIBaltimoreByYear, totalEmissions = sum(Emissions))

with(BaltimoreTotalEmissions, plot(year, 
				totalEmissions,  
				type = "o",
				col = "blue",
				pch = 19,
				lwd = 2, 
				main = "Total emissions from PM2.5 at Baltimore City per year",  
				xlab = "Year", 
				ylab = "Total Emissions"))

dev.copy(png, file = "plot2.png", width = 600, height = 600)
dev.off()