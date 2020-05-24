## question-1 ((Read in the file, making the gene accession numbers the row names. Show a table of values for thefirst six genes)

#downloaded the file from github using following  comand download.file ("URL",destfile="name")
#read the file using comand read.table("name of the file").
#So for that, the name of the object will be given as "x"
#In oder to save the file as an object, run the command. x<-read.table("geneexpression.tsv", header = TRUE)
#then looked the first six genes using head(x) and str(x) by data comand.


download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "geneexpression.tsv")

x<-read.table("geneexpression.tsv", header = TRUE)
head(x)
str(x)
read.table(file="geneexpression.tsv")
save.image("geneexpression.RData")
load("geneexpression.RData")

## question -2 (Make a new column which is the mean of the other columns. Show a table of values for the first sixgenes)

#Aded a new column using x$mean<- rowmeans(x) and added extentions using [,c(2:3)])comand to run every raw but get means for only 2nd and third columns.
# ,c comand stand for every row.
#found the means of first six genes using mean (x[1:6]) comand.

meanofsamples<-rowMeans(x[,c(2:3)])
x$meanofsamples<-rowMeans(x[,c(2:3)])
x[1:6,]


## question-3 (List the 10 genes with the highest mean expression)
# by running the oder ()comand it is possible to list the rowmeans of the genes. Ordering function help to arrange the data set aaccording to user.
# by sorting the data it is possible to list the genes with highest means.sort function use to arange the the data set in assending or disanding order.
# in order to look the 10 genes run the head comand head(x_sorted,10).

order(x$meanofsamples)
x[order(-x$meanofsamples),]
x_sorted <-x[order(-x$meanofsamples),]
head(x_sorted,10)



## question - 4 (Determine the number of genes with a mean <10)
 
# used the  filtered <- subset(x, meanofsamples > 10) to find the genes wich has mean greater than 10.
# filter function is selects or filters the rows of the data table that meet certain criteria creating a new data subset
#  nrow returns the number of rows that are present in a data frame or matrix
 
filtered <- subset(x, meanofsamples > 10)
nrow(filtered)


##5th question (Make a histogram plot of the mean values in png format and paste it into your report)

# using hist()comand draw the histogram.

hist(x$meanofsample,main="distribution of mean",xlab="mean of samples",breaks=30)

