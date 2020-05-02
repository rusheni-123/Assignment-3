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
meanofsample_order <-order(x$meanofsamples)
meanofsamples_order

args(order)

##4th question
# used the x$meanofsamples[which((x$meanofsamples[,3]>10))] to find the genes wich has mean greater than 10.

x$meanofsamples[which(x$meanofsamples[,3]>10)] 
x[,3]>10 

##5th question
# using his()comand draw the histogram.
b<-c(mean)
hist(mean)
