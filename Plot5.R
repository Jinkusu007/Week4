library(ggplot2)

#load mapping file for SCC
#data_file_mapping = readRDS("Source_Classification_Code.rds")
#data_file_mapping = data_file_mapping[grepl("Motor Vehicles", data_file_mapping$Short.Name),]

#Load Data file
data_file <- readRDS("summarySCC_PM25.rds")

#Create FActor for Year and Emission Type and City
data_file$year = factor (data_file$year)
data_file$type = factor (data_file$type)
data_file$fips = factor (data_file$fips)

data_file = subset(data_file, data_file$fips == "24510" & data_file$type == "ON-ROAD")

#Merged mapping and data files 
#merged_data = merge(data_file, data_file_mapping, by = "SCC")

aggreg_sum = aggregate(data_file$Emissions, by=list(data_file$year), FUN = sum, na.rm = TRUE)

#attach data file variables to environment 
#attach(aggreg_sum)

png(filename='plot5.png')

barplot(aggreg_sum$x, names.arg = aggreg_sum$Group.1, main = expression(paste('PM'[2.5], ' Emissions - Motor Vehicles in Baltimore City')), ylab = expression(paste('PM'[2.5], ' Emissions')), xlab = "Years")

dev.off()

#detach(aggreg_sum)