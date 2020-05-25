##Question 6 (Import this csv file into an R object. What are the column names?)

#run args() to find the arguments needed to read a csv file.
#In order to make an object, the data set needed to be saved under a name in environment. So for that, the name of the object will be given as "T"
#In oder to save the file as an object, run the command. R<-read.csv(file=link of the raw data,header=True,sep=",")
#Then run the command to depict the table in console by typing R 
#In order to know the names of the columns in the cvs file, run the command colnames(R)
#This step will provide you with column names as characters. Characters are vectors.

args(read.csv)
R<-read.csv(file = "https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",header = TRUE,sep = ",")
R
colnames(R)


##Question 7 (Calculate the mean and standard deviation of tree circumference at the start and end of the study at both sites).

#Use the function mean() and sd() to calculate the mean and sd in the numerics. It shuould be noted that the column needed to be specified from the Table(R)
#Make a subset for two sites(northeast and southwest). Name the subset as "Northeast" and "Southwest"
#Define the arguments you want to include in the subsets.
#As for an example;In Northeast <-(R[R$Site=="northeast",]) - the name of the subset is Northeast. R is the table which include the data of cvs file. 
#Define the column in the table using the symbol($).== syntax defines R$Site eqivalent to northeast.
#"" syntax is used in northeast as northeast is a character. 
#In, Northeast <-(R[R$Site=="northeast",]) the comma after "northeast" suggest that the function is run in all columns.

### Northeast
Northeast <-(R[R$Site=="northeast",])
Northeast
mean(Northeast$Circumf_2004_cm)
sd(Northeast$Circumf_2004_cm)
mean(Northeast$Circumf_2019_cm)
sd(Northeast$Circumf_2019_cm)


### Southwest
Southwest <-(R[R$Site=="southwest",])
Southwest
mean(Southwest$Circumf_2004_cm)
sd(Southwest$Circumf_2004_cm)
mean(Southwest$Circumf_2019_cm)
sd(Southwest$Circumf_2019_cm)




##Question 8 (Make a box plot of tree circumference at the start and end of the study at both sites).
#use the function boxplot() to obtain the box plot for specific column.
#since it is for both the sites, run the function by selecting Northeast and Southwest objects instead of selecting  R.
### The boxplot diagrams for both start and the end of the stduy  
boxplot(Northeast$Circumf_2004_cm)
boxplot(Northeast$Circumf_2019_cm)


boxplot(Southwest$Circumf_2004_cm)
boxplot(Southwest$Circumf_2019_cm)

### Making a one box plot 
#Combining all the 4 box plots to a single box plot diagram. Use function xlab() to give the title for x-axis, ylab() for title to y-axis,main() is for title of the plot,Names() function is used to give names to each sectors.
boxplot(main="circumferences of trees in two sites",Northeast$Circumf_2004_cm,Northeast$Circumf_2019_cm,Southwest$Circumf_2004_cm,Southwest$Circumf_2019_cm,names=c("N2004","N2019","S2004","S2019"),ylab="Circumference(cm)",xlab="Trees")

## Question 9(Calculate the mean growth over the past 10 years at each site).

### Creating the mean growth of the two subsets(Northeast and Southwest)

#run args() funtion to find the arguments needed for the rowMeans. Northeast$Circumf_2004
#The reason for the use of rowMeans is that this fucntion will produce the mean in considering the every row where as selective columns are being sellected.
#column 4 and column 6 are specified as they hold data for a 10 years time period.

args(rowMeans)
growth_Northeast <- rowMeans(Northeast[,c(4:6)])
growth_Northeast
growth_Southwest <- rowMeans(Southwest[,c(4:6)])
growth_Southwest

### Insert the new column to both the table created under North_east and South_west

#$ syntax is used to add the new columns to each respective tables.
#Northeast$growth_Northeast will be adding the column known as growth_Northeast to Northeast table.
#Southwest$growth_Southwest will be adding the column known as growth_Southwest to Southwest table

Northeast$growth_Northeast <-rowMeans(Northeast[,c(4:6)])
Northeast
Southwest$growth_Southwest <-rowMeans(Southwest[,c(4:6)])
Southwest

## Question 10(Use the t.test and wilcox.test functions to estimate the p-value that the 10 year growth is different at the two sites).

#A new object named "growthin10" will be created which contains mean growth of last 10 years.rowmeans() function will be used which will be determing the means of every row.
#4 to 6 columns are been selected which contains 10 years' worth data.
#R is the data frame which is originally stored.
#Add the column growthin10 to the R 
growthin10 <- rowMeans(R[,c(4:6)])
growthin10
R$growthin10 <- rowMeans(R[,c(4:6)])
R

### Application of t-test
#The syntax used below is for a two sample t-test. The reason for use of two sample t-test is that samples of interest are collected from two sides.
t.test(growthin10~R$Site,alternative="greater")

### Application of Wilcox.test
wilcox.test(growthin10~R$Site,alternative="greater")
