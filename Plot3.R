library(ggplot2)

#Load Data file
data_file <- readRDS("summarySCC_PM25.rds")

#Create FActor for Year and Emission Type and City
data_file$year = factor (data_file$year)
data_file$type = factor (data_file$type)
data_file$fips = factor (data_file$fips)

#Filter for Baltimore
data_file = subset(data_file, data_file$fips == "24510")

#attach data file variables to environment 
attach(data_file)

ggplot(data_file, aes(x=year, y=log(Emissions))) + facet_grid(.~type, scales="free") + geom_boxplot() + guides(fill=F) + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year')
ggsave(file="plot3.png")
detach(data_file)