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

aggreg_sum = aggregate(data_file$Emissions, by=list(data_file$year), FUN = sum, na.rm = TRUE)

png(filename='plot2.png')

barplot(aggreg_sum$x, names.arg = aggreg_sum$Group.1, args.legend = list(x = "topleft", col=c("yellow","green"), legend=c("Young","Old")),main = expression(paste('Total', ' PM'[2.5], ' Emissions')),ylab =  expression(paste('PM'[2.5], ' Emissions')), xlab = "Years")

detach(data_file)

dev.off()