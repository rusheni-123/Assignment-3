# PART 2


library("seqinr")
library("R.utils")
library("rBLAST")
library("ape")
library("ORFik")
library("Biostrings")


## Question-1 (Download the whole set of E. coli gene DNA sequences and use gunzip to decompress. Use the makeblast() function to create a blast database. How many sequences are present in the E.coli set?

#Download the whole set of E. coli gene DNA sequences and use gunzip to decompress)
#The link with fa.gv is selected as in the 1st question, it is mentioned to decompress and fa.gv extensioned file are compressed files.
#so the link was selected and fa.gz extension was given to destile name.

download.file('ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz',
              destfile = "ecoligene.fa.gz")

### uncompress the file
#?R.utils package was used whereas gunzip command assit in unzipping the document. The name of the file was given with the extension.
#?overwrite comman was selected as True to keep the original file in the system.

R.utils::gunzip("ecoligene.fa.gz",overwrite=T)

### Making blast data base

makeblastdb("ecoligene.fa",dbtype = "nucl","-parse_seqids")




## Question-2 (Download the sample fasta sequences and read them in as above. For your allocated sequence, determine the length (in bp) and the proportion of GC bases)

#ownload the sample fasta sequences and read them in as above. For your allocated sequence,
#determine the length (in bp) and the proportion of GC bases.
#downloading the file given in assigment pdf file which is of extension fa.
#Since the file is of extension fa,it is clear that the file is already uncompressseed.

download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",destfile = "sample.fa")

#read.fasta command is given to read the downloaded fasta sequences.
#downloaded fastas are saved in working directory as "samplefastas"
samplefastas <- read.fasta("sample.fa")

#one fasta sequence is been selected from the downloaded fasta sequence.
#9th sequence is been selected and saved in the working directory as
"Groupseq"
Groupseq <-samplefastas [[9]]
Groupseq

### length of 9th fasta seq
seqinr::getLength(Groupseq)

### length of GC propotion
seqinr::GC(Groupseq)

## Question-3 (You will be provided with R functions to create BLAST databases and perform blast searches. Use blast to identify what E. coli gene your sequence matches best. Show a table of the top 3 hits includingpercent identity, E-value and bit scores)

#You will be provided with R functions to create BLAST databases and perform blast searches.
#Use blast to identify what E. coli gene your sequence matches best.
#Show a table of the top 3 hits including percent identity, E-value and bitscores.


#make the sequences of commands avaialble in environment, which would allow the user to run blast
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R",destfile
              = "mublast.R")
source("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R")


#select the myblastn_tab to run the blast.
#run args() to identify the arguments needed in the command.
args(myblastn_tab)

#myseq=Groupseq whereas db="ecoligene.fa". db argument will be based on which data base the sequence analysis neede to be run.
# The results of the blast wil be saved as a vector named A
Groupseq_blast <-myblastn_tab(myseq=Groupseq,db="ecoligene.fa")
Groupseq_blast
str(Groupseq_blast)
head(Groupseq_blast)


## Question-4 (You will be provided with a function that enables you to make a set number of point mutations to your sequence of interest. Run the function and write an R code to check the number of mismatches between the original and mutated sequence.)

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
Groupseq
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

### number of mismatch is calculated by nmismatch() fucntion.
nmismatch(alignment)
#according to the answer, it can be assumed that there are 75 differnt sites in the process of randoming 100 positions in the sequence.



# Question5(Using the provided functions for mutating and BLASTing a sequence, determine the number and proportion of sites that need to be altered to prevent the BLAST search from matching the gene of origin. Because the mutation is random, you may need to run this test multiple times to get a reliable answer.)

#Using the provided functions for mutating and BLASTing a sequence, determine the number and
#proportion of sites that need to be altered to prevent the BLAST search from matching the gene of
#origin. Because the mutation is random, you may need to run this test multiple times to get a reliable
#answer.


## The basis of this question is to determinae the treshold of the blast so that the blast will be unable to recognise the gene from it's original sequence.

#running blast index
#creating a data base for the selected sequence 
#Write.fasta function will be used to create a fasta sequece only for the sequence of interst.
#In this question, Groupseq will be saved as a fa extension file and a data base of blast will be created based on the Groupseq.
#dptype is the nucleotides.
write.fasta(Groupseq,names="Groupseq",file.out = "Groupseq.fa")
makeblastdb(file="Groupseq.fa",dbtype = "nucl")


#Groupseq-mut will be named as an object which will save the 10 ramdom mutations.  
#data base of interest will be the data base created for Groupseq.
#myblastn_tab will be the function to run the blast.Initially test with 10 random mutations and increase the mutations gradually.
#Since the final answer needed to be the maximum number of mutations which will not recognise the mutated sequence with original sequence, the function is been applied. 
#In this function, output will be given as 0 for null(mutated sequence is no longer recognised as a sequence related to originl sequence due to number of mutations  applied) and 1 when the mutated sequence is recognised as a mutated version of original sequence.
#A new function named "my_blast_test is been declared where the signature of the function composed of myseq which is the sequrence of interest(mutated sequence),and nmut for number of randomm mutations needed to be applied to the sequence of interest.
#The body of the function will be composing of the ----------- which will be needed to excute the function.
my_blast_test <- function(myseq,nmut) {
  
  Groupseq_mut <- mutator(myseq,nmut)
  
  test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
  
  if (is.null(test)) {
    result=0
  } else {
    result=1
  }
  
  return (result)
  
}
#Application of the function(my_blast_test)
#use the replicate to run the code many times.keep increasing nmuts
#mean(res) will be giving the propotion of succesful blasts
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=10))
res
mean(res)

res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=20))
res
mean(res)

res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=30))
res
mean(res)

res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=40))
res
mean(res)

res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=50))
res
mean(res)
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=100))
res
mean(res)
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=150)) 
res
mean(res)
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=200)) 
res
mean(res)
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=250))
res
mean(res)
res <- replicate(n=10, my_blast_test(myseq=Groupseq, nmut=300))
res
mean(res)

#Number of sites that neede to be altered 250 bases.


# Question 6(Provide a chart or table that shows how the increasing proportion of mutated bases reduces the ability for BLAST to match the gene of origin. Summarise the results in 1 to 2 sentences)
#Provide a chart or table that shows how the increasing proportion of mutated bases reduces the ability
#for BLAST to match the gene of origin. Summarise the results in 1 to 2 sentences.

#In this question,the need to take the propotion of succesul blast hits needed to be taken as a vector in order to draw a graph. 
#In order to do, a fuction is declared naming run-trials which composed of myseq,NMUTS,Ntrials in the signature of the function.In this function,the body will composed of
#the object "res" (n,replicate and my_blast_test).

run_trials<- function(myseq,NMUTS,Ntrials){
  replicate_response <-replicate(n=Ntrials,my_blast_test(myseq = myseq,nmut = NMUTS))
  res <-mean(replicate_response)
  return (res)
}
#A vector will be declared which composed of number of random mutations which are neede to be applied to the gene of interst(Group_seq)
#50,100,150,200,250,300 are used as number of  random mutations applied.
NMUTS<-c(50,100,150,200,250,300).

#A 'for loop' is created to get the corresponding results related to 50,100,150,200,250,300
#Initially a vector was created which named mutation_list. Index was declared as 1 since the output values should not be replacing the previous values in muatation_list
#An object named 'Runtrial_results was created which composed results of run_trial function.
mutation_list<- c()
i=1
for (Numberof_mut in NMUTS) {
  print(Numberof_mut)
  Runtrial_results<-run_trials(myseq = Groupseq,NMUTS = Numberof_mut,Ntrials = 10)
  print(v)
  mutation_list[i]<-Runtrial_results
  i=i+1
}
mutation_list
#Plotting the graph for NMUTS=X and mutation_list=y
plot(NMUTS,mutation_list,xlab="Number of mutated sites",ylab="propotion of succcessful blasts",main="How elevation of mutated bases affect BLAST performance",type="l")
#According to the graph, it can be concluded that the with increase of number of mutated bases in a sequence , the performance of the blast decreases gradually.Eventually,blast will no longer recognise the mutated sequence as a sequence which is mutated from original.
#In this graph,at 250 random mutations, the mutated sequence will be unidentical to the sequence of interest.
