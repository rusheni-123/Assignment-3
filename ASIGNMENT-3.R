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


#Run the args() funtionn to determine the arguments needed to be fulfilled in order to run the code
args(mutator)

#run length(Groupseq) to check the length of the sequence. sequence will be Groupseq in this excercise.
# complete the arguments for mutator function
#Save the mutations as a vector named Groupseq_mut.
#Note that, myseq will be the selected sequence of interest. So in this case , it will be the Groupseq.
#nmut will be the number of random mutations which gonna be applied. This can be of any number less than the length of the sequence.

length(Groupseq)
args(mutator)
Groupseq_mut<-mutator(myseq = Groupseq,nmut =100)
Groupseq_mut


#Creating a pairwise alignment
#The mutated group sequence saved as Groupseq_mut needed to be converted to a DNA string where the data will be saved as a DNA string.
#Reason for doing this function is to efficent storage and ease of manipulation of long data sequence.
#c2s function will convert vector of chatacters to a single string
#PairwiseAlignment function is used to align the selected pairs of sequences. In this case, it will be the sequences which have been converted to DNA strings.(Groupseq_mut,groupseq_)
#pid function states the % similarities/identities of two sequences
#alignment will be the object which stores the results of pairwiseAlignmnet of Groupseq_mut, groupseq_

Groupseq_mut <-DNAString(c2s(Groupseq_mut))
Groupseq_ <-DNAString(c2s(Groupseq))
alignment <-Biostrings::pairwiseAlignment(Groupseq_mut,Groupseq_)
pid(alignment)
alignment


#Comparing sequences to check the positions that have altered in the two sequences which is aligned and saved as a object called alignmnet.
#when run the command comparestrings, ? will depicts the positions of the aligned sequence which have altered. 
compareStrings(alignment)

#number of mismatch is calculated by nmismatch() fucntion.
nmismatch(alignment)
#according to the answer, it can be assumed that there are 75 differnt sites in the process of randoming 100 positions in the sequence.



#Q5
#Using the provided functions for mutating and BLASTing a sequence, determine the number and
#proportion of sites that need to be altered to prevent the BLAST search from matching the gene of
#origin. Because the mutation is random, you may need to run this test multiple times to get a reliable
#answer.


# The basis of this question is to determinae the treshold of the blast so that the blast will be unable to recognise the gene from it's original sequence.

#running blast index
#creating a data base for the selected sequence 
#Write.fasta function will be used to create a fasta sequece only for the sequence of interst.
#In this question, Groupseq will be saved as a fa extension file and a data base of blast will be created based on the Groupseq.
#dptype is the nucleotides.
write.fasta(Groupseq,names="Groupseq",file.out = "Groupseq.fa")
makeblastdb(file="Groupseq.fa",dbtype = "nucl")


#Groupseq-mut will be named as an object which will save the 10 ramdom mutations.  
#data base of interest will be the data base created for Groupseq.
#myblastn_tab will be the function to run the blast
#test with 10 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,10)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
length(Groupseq_mut)

#test with 20 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,20)
test2 <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test2
#test with 30 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,30)
test3 <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test3
#test with 40 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,40)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

#calcualte the length of the sequence which has 50 mutations
length(Groupseq_mut)
Groupseq_mut <- mutator(myseq=Groupseq,50)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
#test with 60 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,60)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
#test with 70 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,70)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
#test with 80 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,80)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
#test with 90 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,90)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

# calcualting randomised blast search for 100 mismathes

Groupseq_mut <- mutator(myseq=Groupseq_mut,100)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test


##test with 150 random mutations
Groupseq_mut <- mutator(myseq=Groupseq_mut,150)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test


##test with 200 random mutations
Groupseq_mut <- mutator(myseq=Groupseq_mut,200)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test


#Q6
#Provide a chart or table that shows how the increasing proportion of mutated bases reduces the ability
#for BLAST to match the gene of origin. Summarise the results in 1 to 2 sentences.
