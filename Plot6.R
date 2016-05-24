library(ggplot2)

#load mapping file for SCC
#data_file_mapping = readRDS("Source_Classification_Code.rds")
#data_file_mapping = data_file_mapping[grepl("Motor Vehicles", data_file_mapping$Short.Name),]

#Load Data file
data_file <- readRDS("summarySCC_PM25.rds")

#Filter dataset
data_file = subset(data_file, data_file$fips == "24510" | data_file$fips == "06037")
data_file = subset(data_file, data_file$type == "ON-ROAD")
data_file$fips[data_file$fips=="24510"] = "Baltimore City"
data_file$fips[data_file$fips=="06037"] = "Los Angeles County"

#Create FActor for Year and Emission Type and City
data_file$year = factor (data_file$year)
data_file$type = factor (data_file$type)
data_file$fips = factor (data_file$fips)

#attach data file variables to environment 
attach(data_file)

ggplot(data_file, aes(x=year, y=log(Emissions), fill = fips)) + facet_grid(.~fips, scales="free") + geom_boxplot() + guides(fill=F) + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year')
ggsave(file="plot6.png")

detach(data_file)