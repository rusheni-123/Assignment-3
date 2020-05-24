
# subject: SLE 712
# Project title

## Assigment 3
Aim of this project is to enhance problem solving using R coding and working together as a team. This project is a combinationof Git hub and Rstudio where Git hub is the version control.
This project anaysis the two data sets(gene_expression.tsv which contain RNA sequence and growth_data.tsv which contain themeasurements for the tree circumference growing at two sites. 
gene_expression.tsv contain RNA sequence of two sites and growth_data.tsv contains measurements for tree circumference growing at two sites, control site and treatment site which were planted 20 years ago.


## Motivation
To practice R studio and Git hub collaberation.

## Contents

gene_expression.tsv-data set for RNA sequence of two samples of interest
README.md
growth_data.csv-contains measurements for tree circumference growing at two sites, control site and treatment site which were planted 20 years ago

## Installation
Rstudio version 1.2.1335 and R

R version 3.6.3

## Guidance steps
your project.

## Contribute
Mandhri Abeysooriya and Rusheni Senanayake.
## Credits

#### Anything else that seems useful
## License
A short snippet describing the license (MIT, Apache etc)
MIT © [Yourname]()
=======



# PART-1.

## Question-1(Read in the file, making the gene accession numbers the row names. Show a table of values for thefirst six genes.)

To addres the first question initially requiredto download the given file "gene_expression.tsv” contains RNA-seq count data for two samples of interest.Therefore used the comand download.file ("URL",destfile="name").in this comand, destfile="name" used to give the destination and name for the downloaded file.secondly,read the file using comand read.table("name of the file").then to make an object, the data set needed to be saved under a name in environment. So for that, the name of the object will be given as "x"
In oder to save the file as an object, run the command. x<-read.table("geneexpression.tsv", header = TRUE)
 then looked the first six genes using head(x) and str(x) by data comand.
 full code use to solve the problem is,
 
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "geneexpression.tsv")

x<-read.table("geneexpression.tsv", header = TRUE)
head(x)
str(x)
read.table(file="geneexpression.tsv")

## Question-2(Make a new column which is the mean of the other columns. Show a table of values for the first sixgenes.)


The name of the new column saved as meanofth samples by using comand - meanofthesample <- and then to find the means of each row used the function rowmeans. here we need to get means for every raw of first six genes and only for 2nd and 3rd columns. therefor it specified as (x[,c(2:3)]). Therfore full code can be write as x$meanofsamples<-rowMeans(x[,c(2:3)]) and to chek the means for first six genes run the   x[1:6,].
Define the column in the table using the symbol($).The reason for the use of rowMeans is that this fucntion will produce the mean in considering the every row where as columns are being sellected

Code to use in solving problem is,

meanofsamples<-rowMeans(x[,c(2:3)])
x$meanofsamples<-rowMeans(x[,c(2:3)])
x[1:6,]


Following table show the new column namely,meanofsample.

    | GeneID        | SRR5150592| SRR5150593| meanofsamples|
    |  :---:        |  :---:    |  :---:    |    :---:     |
    |ENSG00000223972|1          |0          |0.5|
    |ENSG00000227232|0          | 1         |0.5|
    |ENSG00000227232|0          |1          |0.5|
    |ENSG00000278267|0          |0          |0.0|
    |ENSG00000243485|0          |0          |0.0|
    |ENSG00000284332|0          |0          |0.0|
    |ENSG00000237613|0          |0          |0.0|

 
 
 
## Question -3 (List the 10 genes with the highest mean expression)

To list the genes required to use order function. here in this question only required to list 10 genes with highest means. therefore need to mentioned the number of genes along with the sorting comand. Full comad which can be use for this is x_sorted <-x[order(-x$meanofsamples),] and chek the gens bu using head comand head(x_sorted,10).
 
Codes use in solving problem is,

x[order(-x$meanofsamples),
x_sorted <-x[order(-x$meanofsamples),]
head(x_sorted,10)
 
 
Following table show the first ten genes with highest genes.
 
 
  
             Gena ID          |SRR5150592 | SRR5150593| meanofsamples
1. 8683 |    ENSG00000115414  |   311857  |   206347  |259102.0
2. 58210|    ENSG00000210082  |   145916  |   163288  |154602.0
3. 20619|    ENSG00000075624  |   133983  |   116762  |125372.5
4. 58234|    ENSG00000198886  |    91596  |   99943   |95769.5
5. 42896|    ENSG00000137801  |   95158   |   74546   |84852.0
6. 58222|    ENSG00000198804  |    79832  |   84774   |82303.0
7. 58238|    ENSG00000198786  |   74570   |   83589   |79079.5
8. 25675|    ENSG00000196924  |    88225  |    66413  |77319.0
9. 58225|    ENSG00000198712  |   76108   |  77108    |76608.0
10. 49030|   ENSG00000108821   |    80342  |   60127   |70234.5

## Question 4-(Determine the number of genes with a mean <10)

To determine the nuber of genes which has mean value less than 10,subsetting has done.filter function  function is selects or filters the rows of the data table that meet certain criteria creating a new data subset and subsetting was done using code filtered <- subset(x, meanofsamples > 10). Then to get the number used the function,nrow(filtered).nrow returns the number of rows that are present in a data frame or matrix. 

Codes use to solving problem is,

filtered <- subset(x, meanofsamples > 10)
nrow(filtered)

There were 15032 genes with means less than 10.

## Question 5 -(Make a histogram plot of the mean values in png format and paste it into your report.)

Histogram were drwn using hist() function and for easy identification break it to 20 frequencies.histogram were drawn in mean of th samples in the x axis and frequancy was taken to y axis.To save the image in png format export the drawn graph and save the option under png format.

Codes use to obtain histogram is,

hist(x$meanofsamples)
hist(x$Mean,breaks=20)



histogram obtained as follows.

![histogram](http://118.138.234.73:8787/files/project/Assignment-3-final/histogram.pdf)

## Question 6 -(Import this csv file into an R object. What are the column names?)

Initially run args() to find the arguments needed to read a csv file.Then,In order to make an object, the data set needed to be saved under a name in environment. So for that, the name of the object will be given as "R".In oder to save the file as an object, run the command. R<-read.csv(file="tree_circumference,csv",header=true,sep=",").Then run the command to depict the table in console by typing R .To know the names of the columns in the cvs file, run the command colnames(R).This step will provide you with column names as characters. Characters are vectors.
args(read.csv)

Following full codes use in solving the problem.

R<-read.csv(file = "growth_data.csv",header = TRUE,sep = ",")
R
colnames(R)

Column names of R object are as follows.
"Site","TreeID", "Circumf_2004_cm" ,"Circumf_2009_cm","Circumf_2014_cm", "Circumf_2019_cm"



## Question 7-(Calculate the mean and standard deviation of tree circumference at the start and end of the study at both sites)

To calculate the mean and sd of the both sites   function mean() and sd() used in the Numerics. It shuould be noted that the column needed to be specified from the Table(R).Then Make a subset for two sites(northeast and southwest). Name the subset as "Northeast" and "Southwest". To define the arguments you want to include in the subsets used following codes.As for an example;In Northeast <-(R[R$Site=="northeast",]) - the name of the subset is Northeast. R is the table which include the data of cvs file.  Define the column in the table using the symbol($).== syntax defines R$Site eqivalent to northeast.The "" syntax is used in northeast as northeast is a character. In, Northeast <-(R[R$Site=="northeast",]) the comma after "northeast" suggest that the function is run in all columns.

Following comands use to solve the problem.

#Northeast
Northeast <-(R[R$Site=="northeast",])
Northeast
mean(Northeast$Circumf_2004_cm)
sd(Northeast$Circumf_2004_cm)
mean(Northeast$Circumf_2019_cm)
sd(Northeast$Circumf_2019_cm)


#Southwest
Southwest <-(R[R$Site=="southwest",])
Southwest
mean(Southwest$Circumf_2004_cm)
sd(Southwest$Circumf_2004_cm)
mean(Southwest$Circumf_2019_cm)
sd(Southwest$Circumf_2019_cm)

Mean and SD of the notheast site are respectively mean(Northeast$Circumf_2004_cm)- 5.078 and SD(Northeast$Circumf_2004_cm)  1.059127 mean(Northeast$Circumf_2019_cm)-40.052, SD(Northeast$Circumf_2019_cm)-16.90443

mean and SD  of the south east sites are mean(Southwest$Circumf_2004_cm)-5.076,SD(Southwest$Circumf_2004_cm)-1.060527,mean(Southwest$Circumf_2019_cm)- 59.772,SD(Southwest$Circumf_2019_cm)- 22.57784.

## Question 8-(Make a box plot of tree circumference at the start and end of the study at both sites) 

Box plots were drawn for both the sites using  the function boxplot() to obtain the box plot for specific column.since it is for both the sites, it is better to run the function by selecting Northeast and Southwest objects instead R.

Following codes run to obtain the boxplots for sites.
 
for notheast,
boxplot(Northeast$Circumf_2004_cm)
boxplot(Northeast$Circumf_2019_cm)
boxplot(Northeast$Circumf_2004_cm ~ Northeast$Circumf_2019_cm, horizontal = F)

For southwest,
boxplot(Southwest$Circumf_2004_cm)
boxplot(Southwest$Circumf_2019_cm)
boxplot(Southwest$Circumf_2004_cm ~ Southwest$Circumf_2019_cm)
 
Box plots for northeast,
 
![boxplot](http://118.138.234.73:8787/files/project/Assignment-3-final/Rplot%20for%20NE%20in%202004.jpeg)
![boxplot](http://118.138.234.73:8787/files/project/Assignment-3-final/Rplot%20of%20NE%20%20for%202019.jpeg)

Boxplotsfor southwest

![boxplot](http://118.138.234.73:8787/files/project/Assignment-3-final/Rplot%20of%20SW%20in%202019.jpeg)
![boxplot](http://118.138.234.73:8787/files/project/Assignment-3-final/Rplot%20of%20SW%20of%202004.jpeg)

## Question 9-(Calculate the mean growth over the past 10 years at each site.) 

To calculate the meangrowth over the past 10 years at each site run args() funtion to find the arguments needed for the rowMeans. The reason for the use of rowMeans is that this fucntion will produce the mean in considering the every row where as columns are being sellected.column 4 and column 6 are specified as they hold data for a 10 years time period.
following codes run to solve the problem,
args(rowMeans)
rowMeans(Northeast[,c(4:6)])
rowMeans(Southwest[,c(4:6)])

calculated mean growths are.....




# Question 10-(Use the t.test and wilcox.test functions to estimate the p-value that the 10 year growth is different at the two sites.)



Following codes run to solve the problem.

growth_Northeast<-c(Northeast[,c(4:6)])
growth_Northeast
is.character(growth_Northeast)
class(growth_Northeast)
as.factor(growth_Northeast


library("seqinr")
library("R.utils")
library("rBLAST")
library("ape")
library("ORFik")
library("Biostrings")


## Question 1-Download the whole set of E. coli gene DNA sequences and use gunzip to decompress. Use the makeblast() function to create a blast database. How many sequences are present in the E.coli set?

#Download the whole set of E. coli gene DNA sequences and use gunzip to decompress
The link with fa.gv is selected as in the 1st question, it is mentioned to decompress and fa.gv extensioned file are compressed files.
so the link was selected and fa.gz extension was given to destile name.

download.file('ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz',
              destfile = "ecoligene.fa.gz")

#uncompress the file
R.utils package was used whereas gunzip command assit in unzipping the document. The name of the file was given with the extension.
overwrite comman was selected as True to keep the original file in the system.
R.utils::gunzip("ecoligene.fa.gz",overwrite=T)

# Making blast data base
makeblastdb("ecoligene.fa",dbtype = "nucl","-parse_seqids")

#Number of sequences present in E.coli set
4140




## Question 2 (Download the sample fasta sequences and read them in as above. For your allocated sequence, determine the length (in bp) and the proportion of GC bases.)

#Download the sample fasta sequences and read them in as above. For the allocated sequence and determine the length (in bp) and the proportion of GC bases.
Downloading the file given in assigment pdf file which is of extension fa.
Since the file is of extension fa,it is clear that the file is already uncompressseed.
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa",
              destfile = "sample.fa")

#read.fasta command is given to read the downloaded fasta sequences.
downloaded fastas are saved in working directory as "samplefastas"
samplefastas <- read.fasta("sample.fa")

#one fasta sequence is been selected from the downloaded fasta sequence.
9th sequence is been selected and saved in the working directory as "Groupseq"
Groupseq <-samplefastas [[9]]
Groupseq

#length of 9th fasta seq
seqinr::getLength(Groupseq)

#length of GC propotion
seqinr::GC(Groupseq)




## Question 3 (You will be provided with R functions to create BLAST databases and perform blast searches. Use blast to identify what E. coli gene your sequence matches best. Show a table of the top 3 hits including percent identity, E-value and bit scores.You will be provided with R functions to create BLAST databases and perform blast searches. Use blast to identify what E. coli gene your sequence matches best. Show a table of the top 3 hits including percent identity, E-value and bit scores.)

#make the sequences of commands avaialble in environment, which would allow the user to run blast
source("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R")
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/mutblast_functions.R",destfile = "Markcodes.R")


#select the myblastn_tab to run the blast.
run args() to identify the arguments needed in the command.
myseq=Groupseq whereas db="ecoligene.fa". db argument will be based on which data base the sequence analysis neede to be run.
The results of the blast wil be saved as a vector named A
args(myblastn_tab)
Groupseq_blast <-myblastn_tab(myseq=Groupseq,db="ecoligene.fa")
str(Groupseq_blast)
head(Groupseq_blast)



## Qustion 4  (You will be provided with a function that enables you to make a set number of point mutations to your sequence of interest. Run the function and write an R code to check the number of mismatches between the original and mutated sequence.)

#Application of random mutations
Run the args() funtionn to determine the arguments needed to be fulfilled in order to run the code.Run length(Groupseq) to check the length of the sequence. sequence will be Groupseq in this excercise. Complete the arguments for mutator function. Save the mutations as a vector named Groupseq_mut. Note that, myseq will be the selected sequence of interest. So in this case , it will be the Groupseq.nmut will be the number of random mutations which gonna be applied. This can be of any number less than the length of the sequence.

length(Groupseq)
args(mutator)
Groupseq_mut<-mutator(myseq = Groupseq,nmut =100)
Groupseq_mut


#Creating a pairwise alignment
The mutated group sequence saved as Groupseq_mut needed to be converted to a DNA string where the data will be saved as a DNA string.Reason for doing this function is to efficent storage and ease of manipulation of long data sequence.c2s function will convert vector of chatacters to a single string
PairwiseAlignment function is used to align the selected pairs of sequences. In this case, it will be the sequences which have been converted to DNA strings.(Groupseq_mut,groupseq_).pid function states the % similarities/identities of two sequences
alignment will be the object which stores the results of pairwiseAlignmnet of Groupseq_mut, groupseq_

Groupseq_mut <-DNAString(c2s(Groupseq_mut))
Groupseq_ <-DNAString(c2s(Groupseq))
alignment <-Biostrings::pairwiseAlignment(Groupseq_mut,Groupseq_)
pid(alignment)
alignment

#comparing the aligned sequences
Comparing sequences to check the positions that have altered in the two sequences which is aligned and saved as a object called alignmnet.
when run the command comparestrings, ? will depicts the positions of the aligned sequence which have altered. 
compareStrings(alignment)

#number of mismatch is calculated by nmismatch() fucntion.
nmismatch(alignment)
according to the answer, it can be assumed that there are 75 differnt sites in the process of randoming 100 positions in the sequence.



## Question 6  (Using the provided functions for mutating and BLASTing a sequence, determine the number and proportion of sites that need to be altered to prevent the BLAST search from matching the gene of origin. Because the mutation is random, you may need to run this test multiple times to get a reliable answer.)

The basis of this question is to determinae the treshold of the blast so that the blast will be unable to recognise the gene from it's original sequence.

#running blast index
creating a data base for the selected sequence.Write.fasta function will be used to create a fasta sequece only for the sequence of interst.In this question, Groupseq will be saved as a fa extension file and a data base of blast will be created based on the Groupseq.dptype is the nucleotides.
write.fasta(Groupseq,names="Groupseq",file.out = "Groupseq.fa")
makeblastdb(file="Groupseq.fa",dbtype = "nucl")

#Testing randomly input mutations in order to determine Null
Groupseq-mut will be named as an object which will save the 10 ramdom mutations.  
data base of interest will be the data base created for Groupseq.
myblastn_tab will be the function to run the blast


test with 10 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,10)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test
length(Groupseq_mut)

test with 20 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,20)
test2 <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test2

test with 30 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,30)
test3 <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test3

test with 40 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,40)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

Test with 50 mutations
length(Groupseq_mut)
Groupseq_mut <- mutator(myseq=Groupseq,50)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 60 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,60)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 70 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,70)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 80 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,80)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 90 random mutations
Groupseq_mut <- mutator(myseq=Groupseq,90)
test <- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

Test with 100 mismathes
Groupseq_mut <- mutator(myseq=Groupseq_mut,100)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 150 random mutations
Groupseq_mut <- mutator(myseq=Groupseq_mut,150)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test

test with 200 random mutations
Groupseq_mut <- mutator(myseq=Groupseq_mut,200)
test<- myblastn_tab(myseq = Groupseq_mut, db = "Groupseq.fa")
test




