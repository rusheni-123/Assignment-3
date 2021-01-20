mtcars<-mtcars
mtcars
ave<-mtcars[rowmeans(apply(mtcars,1,sd))]
                     
ave<-rowMeans(apply(mtcars,1,sd))

rowMeans(mtcars[,])
p<-rowMeans(mtcars)
 q<-apply(mtcars,1,)


mtcars[mtcars$mpg>20 & mtcars$wt>3,]




head(mtcars)
colnames(mtcars)
pop<-mtcars[order(rownames(mtcars)),]
pop

meancol<-rowMeans(mtcars[,c(2:3)])
meancol
mtcars$meancol<-rowMeans(mtcars[,c(2:3)])
mtcars[1:6,]


highestmean<-order(mtcars$meancol)
highestmean<-mtcars[order(mtcars$meancol,decreasing = T),]
highestmean[1:10,]
HO<-sort(mtcars$meancol,decreasing = T)
HO
as.data.frame(HO)


meanhigh100<-mtcars[mtcars$meancol>100,]
meanhigh100
dim(meanhigh100)



#download file
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/mydata.tsv", destfile="lol.tsv")



exam1<-read.table(file = "lol.tsv",header = T)
head(exam1)

#getting sum of the column in a data frame where 1st column contain factors/characters
sum(exam1$ERR1720605)

#finding column sum of columns but not just one.In this code ,noticed that it runs for column su of 2 n 3rd. In operating just one column wont give 
#an answer cz its not 2d then.

exam1$z<-colSums(exam1[,c(2,3)],na.rm = F)
z

#The most common error message of colSums, rowSums, colMeans, and rowMeans is the following:

#Error in colMeans(x) : ‘x’ must be numeric


#this occcur when the data frame/matrix given is not completely numeric just like the exam1 table where 1st column is characters.
#therefore, in order to solve this

#First, we have to create a logical vector that specifies which of our columns are numeric…

exam1subset<-unlist(lapply(exam1,is.numeric))
exam1subset


##as you can see, lapply function is been applied to  each column to check whether column contains numeric


#then we can use this logical vector to exclude all non-numeric columns of our data
colSumm<-colSums(exam1[,exam1subset])
colSumm
dim(colSumm)

#
exam1$rowsumm<-rowSums(exam1[,exam1subset])
exam1
class(exam1)
dim(exam1)

#######Average sd for each gene
exam1$averagee<-mean(apply(mtcars[,2:4],1,sd))
averagee

averageee<-mean(averagee[,2:4])

##################################

cor(exam1$ERR1720604,exam1$ERR1720605)

mtcars

average4<-subset(mtcars[mtcars$cyl==4,])

dim(average4)
class(average4)

average4<-mean(average4$mpg)


#
average6<-subset(mtcars[mtcars$cyl==6,])

class(average6)


average6<-mean(average6$mpg)
average6

#
average8<-subset(mtcars[mtcars$cyl==8,])

class(average8)

average8<-mean(average8$mpg)


##saving plot



# Give the chart file a name.
png(file = "boxplot.png")
# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

# Save the file.
dev.off()

#formulas of the form y~x where, y is a numeric vector which is grouped according to the value of x.

#For example, in our dataset mtcars, the mpg can be our numeric vector. cyl can be our grouping variable,
#so that we get the boxplot for each cylinder seperately.







#only sample fuction can give random numbers and be replaced like that
sample(1:10,20, replace=TRUE)

sample(1:20,30, replace=TRUE)




#functions

circum<-function(r){
  area=pi*r^2
  return(area)
}

x<-c(1:5)
x


#applying the function to x
circum(x)


wholepara<-function(r){
  area=pi*r^2
  circumference=2*pi*r^2
  return(c(area=area,circumference=circumference))
}


wholepara(x)


#for loops 
#for loops on numbers from 1 to 5 where the number is squared until 5th number.

for(i in 1:5){
  print(i^2)
}



#for looping for mpg where mpg in mtcars is squared 

for (mpg in mtcars$mpg) {
print(mpg^2)  
}


#for looping mtcars$mpg
for (mpg in mtcars$mpg) {
  if(mpg>30){
    print("high")
  }else {
        print("low")
      }
     }


#for loop with many conditions. Use else if

colllla<-for (mpg in mtcars$mpg) {
  if(mpg>30){
    print("high")
  }else if(mpg>20){
    print("moderate")
  }else{print("low")
    }
}


#while loop
x<-1
while (x<10) {
print(x)
  x<-x+1
}


while (zed<10) {
  print(zed)
  zed<-zed+1
  
}

rbin
mat <- matrix(rbinom(20,50,0.8),nrow = 5)

apply(mat,1,median)



cubsum<-function(x,y){
  xcubed<-x^2
  ycubed<-y^2
  z<-c(xcubed+ycubed)
  return(z)
}


cubsum(2,3)








rbinom()





