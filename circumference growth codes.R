#Q6 Import this csv file into an R object. What are the column names?

#run args() to find the arguments needed to read a csv file.
#In order to make an object, the data set needed to be saved under a name in environment. So for that, the name of the object will be given as "T"
#In oder to save the file as an object, run the command. R<-read.csv(file="tree_circumference,csv",header=true,sep=",")
#Then run the command to depict the table in console by typing R 
#In order to know the names of the columns in the cvs file, run the command colnames(R)
#This step will provide you with column names as characters. Characters are vectors.
args(read.csv)

R<-read.csv(file = "growth_data.csv",header = TRUE,sep = ",")
R

colnames(R)
row.names(R)


#Q7 Calculate the mean and standard deviation of tree circumference at the start and end of the study at both sites.

#Use the function mean() and sd() to calculate the mean and sd in the Numerics. It shuould be noted that the column needed to be specified from the Table(R)
  #Make a subset for two sites(northeast and southwest). Name the subset as "Northeast" and "Southwest"
  #define the arguments you want to include in the subsets.
  #As for an example;In Northeast <-(R[R$Site=="northeast",]) - the name of the subset is Northeast. R is the table which include the data of cvs file. 
  #Define the column in the table using the symbol($).== syntax defines R$Site eqivalent to northeast.
  #"" syntax is used in northeast as northeast is a character. 
  #In, Northeast <-(R[R$Site=="northeast",]) the comma after "northeast" suggest that the function is run in all columns.

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




#Q8 Make a box plot of tree circumference at the start and end of the study at both sites.
 #use the function boxplot() to obtain the box plot for specific column.
 #since it is for both the sites, it is better to run the function by selecting Northeast and Southwest objects instead R.
 # The boxplot diagrams for both start and the end of the stduy  
boxplot(Northeast$Circumf_2004_cm)
boxplot(Northeast$Circumf_2019_cm)


boxplot(Southwest$Circumf_2004_cm)
boxplot(Southwest$Circumf_2019_cm)

#Q9 Calculate the mean growth over the past 10 years at each site.
 #run args() funtion to find the arguments needed for the rowMeans. 
 #The reason for the use of rowMeans is that this fucntion will produce the mean in considering the every row where as columns are being sellected.
 #column 4 and column 6 are specified as they hold data for a 10 years time period.

args(rowMeans)
rowMeans(Northeast[,c(4:6)])
rowMeans(Southwest[,c(4:6)])


#Q10 Use the t.test and wilcox.test functions to estimate the p-value that the 10 year growth is different at
##the two sites.

growth_Northeast<-c(Northeast[,c(4:6)])
growth_Northeast
p <-as.data.frame(growth_Northeast)
growth_Southwest <-c(Southwest[,c(4:6)])
q <-as.data.frame(growth_Southwest)
?t.test
args(t.test)
t.test(file=Northeast,)




