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




##Q4
#You will be provided with a function that enables you to make a set number of point mutations to your
#sequence of interest. Run the function and write an R code to check the number of mismatches
#between the original and mutated sequence.

mutator(myseq = )
