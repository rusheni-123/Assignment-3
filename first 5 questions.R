## first question.
#downloaded the file from github using following  comand download.file(URL) and name the file using destfile= "name"
#read the file using comand read.table("name of the file").
#then looked the first six genes using head and str by data comand.

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "geneexpression.tsv")

x<-read.table("geneexpression.tsv", header = TRUE)
head(x)
str(x)
read.table(file="geneexpression.tsv")
save.image("geneexpression.RData")
load("geneexpression.RData")

## 2nd question.

#Aded a new column using x$mean<- rowmeans(x)
#found the means of first six genes using mean (x[1:6]) comand.

meanofsamples<-rowMeans(x[,c(2:3)])
meanofsamples
x$meanofsamples<-rowMeans(x[,c(2:3)])
x
x[1:6,]


## 3rd question
# by running the oder ()comand it is possible to list the rowmeans of the genes

order(x$meanofsamples)
x[order(-x$meanofsamples),
  
x_sorted <-x[order(-x$meanofsamples),]
head(x_sorted,10)



##4th question
# used the x$[which((x$meanofsamples>10),] to find the genes wich has mean greater than 10.
filtered <- subset(x, meanofsamples > 10)
nrow(filtered)


##5th question
# using hist()comand draw the histogram.

hist(x$meanofsamples)

hist(x$Mean,breaks=10)


#PART 2


library("seqinr")
library("rBLAST")
library("R.utils")

##Download the whole set of E. coli gene DNA sequences and use gunzip to decompress

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",
              destfile = "ecoligene")

## delete fasta file if any exist
unlink("ecoligene")
## uncompress the file
R.utils::gunzip("ecoligene",overwrite=TRUE)
gunzip("ecoligene")

## create the BLAST DB.
makeblastdb("ecoligene",dbtype="nucl", "-parse_seqids")

## DOWNLOAD THE SAMPLE FILE
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",
              destfile = "sample")
## read in toR
b <- read.fasta("sample")
myseq <- b[[9]]
myseq

str(myseq)

#question 2
## calculate the GC content
str(myseq)
seqinr:: GC(myseq)

# question 3

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R",
              destfile = "mublastfunction")
source("mublastfunction")
res <- myblastn_(myseq= myseq, db = "ecoligene")


##Download the whole set of E. coli gene DNA sequences and use gunzip to decompress

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",
              destfile = "ecoligene")

## delete fasta file if any exist
unlink("ecoligene")
## uncompress the file
R.utils::gunzip("ecoligene",overwrite=TRUE)
gunzip("ecoligene")

## create the BLAST DB.
makeblastdb("ecoligene",dbtype="nucl", "-parse_seqids")

## DOWNLOAD THE SAMPLE FILE

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",
              destfile = "sample")
## read in toR

b <- read.fasta("sample")
myseq <- b[[9]]
myseq

str(myseq)

#question 2
## calculate the GC content

str(myseq)
seqinr:: GC(myseq)

# question 3

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R",
              destfile = "mublastfunction")
source("mublastfunction")
res <- myblastn_(myseq= myseq, db = "ecoligene")
