<<<<<<< Master
SLE 712
## Project title
Assigment 3
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



# part 1
## question-1(Read in the file, making the gene accession numbers the row names. Show a table of values for thefirst six genes.)

To addres the first question initially requiredto download the given file "gene_expression.tsv” contains RNA-seq count data for two samples of interest.Therefore used the comand download.file ("URL",destfile="name").i this comand, destfile="name" used to give the destination and name for the downloaded file.secondly,read the file using comand read.table("name of the file").then to make an object, the data set needed to be saved under a name in environment. So for that, the name of the object will be given as "x"
In oder to save the file as an object, run the command. x<-read.table("geneexpression.tsv", header = TRUE)
 then looked the first six genes using head(x) and str(x) by data comand.

## question-2(Make a new column which is the mean of the other columns. Show a table of values for the first sixgenes.)

The name of the new column saved as meanofth samples by using comand - meanofthesample <- and then to find the means of each row used the function rowmeans. here we need to get means for every raw of first six genes and only for 2nd and 3rd columns. therefor it specified as (x[,c(2:3)]). therfore full code can be write as x$meanofsamples<-rowMeans(x[,c(2:3)]) and to chek the means for first six genes run the   x[1:6,].
following table show the new column namely,meanofsample.

    | GeneID        | SRR5150592| SRR5150593| meanofsamples|
    |  :---:        |  :---:    |  :---:    |    :---:     |
    |ENSG00000223972|1          |0          |0.5|
    |ENSG00000227232|0          | 1         |0.5|
    |ENSG00000278267|0          |0          |0.0|
    |ENSG00000243485|0          |0          |0.0|
    |ENSG00000284332|0          |0          |0.0|
    |ENSG00000237613|0          |0          |0.0|
## question -3 (List the 10 genes with the highest mean expression)

to list the genes required to use order function. here in this question only required to list 10 genes with highest means. therefore need to mentioned the number of genes along with the sorting comand. full comad which can be use for this is x_sorted <-x[order(-x$meanofsamples),] and chek the gens bu using head comand head(x_sorted,10).
 following table show the first ten genes with highest genes.
 
                GeneID SRR5150592 SRR5150593 meanofsamples
8683  ENSG00000115414     311857     206347      259102.0
58210 ENSG00000210082     145916     163288      154602.0
20619 ENSG00000075624     133983     116762      125372.5
58234 ENSG00000198886      91596      99943       95769.5
42896 ENSG00000137801      95158      74546       84852.0
58222 ENSG00000198804      79832      84774       82303.0
58238 ENSG00000198786      74570      83589       79079.5
25675 ENSG00000196924      88225      66413       77319.0
58225 ENSG00000198712      76108      77108       76608.0
49030 ENSG00000108821      80342      60127       70234.5

## question 4-(Determine the number of genes with a mean <10)
to determine the nuber of genes which has mean value less than 10,subsetting has done.subset saved as filtered <- function and subsetting was done using code filtered <- subset(x, meanofsamples > 10). then to get the number used the function,nrow(filtered). there were 15032 genes with means less than 10.

## question 5 -(Make a histogram plot of the mean values in png format and paste it into your report.)
histogram were drwn using hist() function and for easy identification break it to 20 frequencies.histogram were drawn in mean of th samples in the x axis and frequancy was taken to y axis.To save the image in png format export the drawn graph and save the option under png format.
histogram as follows.





