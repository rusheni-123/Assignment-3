##  Question-1 ((Read in the file, making the gene accession numbers the row names. Show a table of values for the first six genes)

#Download the file from github using download.file ("URL",destfile="name") command.
#Read the file using read.table("name of the file") command and save it as "x" in the environment.
#In oder to read the file(x) run the command, x<-read.table("geneexpression.tsv", header = TRUE)
#Then observed the first six genes using head(x) command.


download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",
              destfile = "geneexpression.tsv")

x<-read.table("geneexpression.tsv", header = TRUE)
head(x)


## Question -2 (Make a new column which is the mean of the other columns. Show a table of values for the first sixgenes)

#An object named "meanofsamples" is saved in the environment using meanofthesample <- and then to find the means of each row, rowmeans() function is used. 
#The reason for the use of rowMeans is that this fucntion will produce the mean in considering the every row where as columns are being selective.
#rowmeans(x[,c(2:3)]) command will give an output where mean of the rows will be calculated by considering columns 2 and 3. 
#Comma used as soon as square brackets open depicts the fact that this function consider all the rows.
#Therfore full code can be written as x$meanofsamples<-rowMeans(x[,c(2:3)]) and to check the means for first six genes run x[1:6,]
#Spefic columns on the table will be selected by using the syntax($) to run the command. 

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
 

#An object name "filtered" is created in environment.
#meanofsample column is selected and >10 condition is applied.
#This function is run in every rows of the column.
# nrow(filtered) command is used to calculate the number of rows which have mean of the samples greater than 10.
filtered <- subset(x, meanofsamples > 10)
nrow(filtered)


## Question-5 (Make a histogram plot of the mean values in png format and paste it into your report)


### Using hist()command, histogram was drawn.
#main() will be the title of the histogram,xlab() and breaks() will be 5 frequencies for better graphical representation.

hist(x$meanofsamples,main="distribution of mean",xlab="mean of samples",breaks=5)








