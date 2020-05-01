download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile = "growth_data.csv")
read.csv(file = "growth_data.csv",header = TRUE,sep = ",")
head(x)
str(x)
