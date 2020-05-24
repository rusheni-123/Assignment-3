
#subjest: SLE 712
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







