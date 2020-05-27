##  Question-1 ((Read in the file, making the gene accession numbers the row names. Show a table of values for thefirst six genes)

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

## Question -2 (Make a new column which is the mean of the other columns. Show a table of values for the first sixgenes)

#Aded a new column using x$mean<- rowmeans(x) and added extentions using [,c(2:3)])comand to run every raw but get means for only 2nd and third columns.
# ,c comand stand for every row.
#found the means of first six genes using mean (x[1:6]) comand.

meanofsamples<-rowMeans(x[,c(2:3)])
x$meanofsamples<-rowMeans(x[,c(2:3)])
x[1:6,]


## Question-3 (List the 10 genes with the highest mean expression)

#Values in the column (meanofsamples) will be arranged in descending order and named as "ranks". decreasing argument will be TRUE.
#This will be giving the results of the highest values to the lowest values of the column(meanofsamples) in reference to "GeneID"
#order() will results with ranking positions for each element.
#Sort() will be sorting out the results in reference to "meanofsample" column. decreasing will be true to obtain highest value in numeric.
#Since  the object "ranks" composed of interger data type, as,data frame(x[ranks,]) will be used to convert the integer data type to a data frame.
#An object named "decended" will be created and first 10 rows of all the columns will be executed with the command, decended[1:10,]
#This will be providing the highest mean values of the samples.

ranks <-order(x$meanofsamples,decreasing = T)
ranks
sort(x$meanofsamples,decreasing = T,)
decended <-as.data.frame(x[ranks,])
decended[1:10,]


## Question-4 (Determine the number of genes with a mean <10)
 
# used the filtered <- subset(x, meanofsamples > 10) command to find the genes which have mean greater than 10.
# filter() is selected whuch will filters the every row of the data frame.
# nrow() will returns the number of rows that are present in a data frame(x)
 
filtered <- subset(x, meanofsamples > 10)
nrow(filtered)


## Question-5 (Make a histogram plot of the mean values in png format and paste it into your report)


### Using hist()comand draw the histogram
#main() will be the title of the histogram,xlab() and breaks will be 5 frequencies for better graphical representation.
hist(x$meanofsamples,main="distribution of mean",xlab="mean of samples",breaks=5 )








