######################################################################################
### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
######################################################################################

## Read data
NEI <- readRDS("summarySCC_PM25.rds")

## Calculate total emissions per year

library(dplyr)

NEIByYear <- group_by(NEI, year)
totalEmissions <- summarise(NEIByYear, totalEmissions = sum(Emissions))

## Plot

with(totalEmissions, plot(year, 
				totalEmissions,  
				type = "o",
				col = "blue",
				pch = 19,
				lwd = 2, 
				main = "Total emissions from PM2.5 per year",  
				xlab = "Year", 
				ylab = "Total Emissions"))

dev.copy(png, file = "plot1.png", width = 600, height = 600)
dev.off()
