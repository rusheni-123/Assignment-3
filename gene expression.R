download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "gene_expression.tsv")

x <- read.table("gene_expression.tsv",header = TRUE,stringsAsFactors = FALSE,row.names = 1,)
read.table(file = "gene_expression.tsv")
head(x)
str(x)
 
