#Load Data file
data_file <- readRDS("summarySCC_PM25.rds")

#Create FActor for Year and Emission Type
data_file$year = factor (data_file$year)
data_file$type = factor (data_file$type)

#attach data file variables to environment 
attach(data_file)

aggreg_sum = aggregate(data_file$Emissions, by=list(data_file$year), FUN = sum, na.rm = TRUE)

png(filename='plot1.png')

barplot(aggreg_sum$x, names.arg = aggreg_sum$Group.1, main = expression(paste('Total', ' PM'[2.5], ' Emissions')), ylab =expression(paste('PM'[2.5], ' Emissions')), xlab = "Years")

dev.off()