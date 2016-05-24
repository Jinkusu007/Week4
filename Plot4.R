library(ggplot2)

#load mapping file for SCC
data_file_mapping = readRDS("Source_Classification_Code.rds")
data_file_mapping = data_file_mapping[grepl("coal", data_file_mapping$Short.Name),]

#Load Data file
data_file <- readRDS("summarySCC_PM25.rds")

#Create FActor for Year and Emission Type and City
data_file$year = factor (data_file$year)
data_file$type = factor (data_file$type)
data_file$fips = factor (data_file$fips)

#Merged mapping and data files 
merged_data = merge(data_file, data_file_mapping, by = "SCC")

aggreg_sum = aggregate(merged_data$Emissions, by=list(merged_data$year), FUN = sum, na.rm = TRUE)

#attach data file variables to environment 
attach(aggreg_sum)

png(filename='plot4.png')

barplot(aggreg_sum$x, names.arg = aggreg_sum$Group.1, main = expression(paste('PM'[2.5], ' Emissions - Coal Related')), ylab = expression(paste('PM'[2.5], ' Emissions')), xlab = "Years")

dev.off()

detach(aggreg_sum)