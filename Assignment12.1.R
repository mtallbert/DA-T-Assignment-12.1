data1=read.table(url("https://archive.ics.uci.edu/ml/machine-learning-databases/yeast/yeast.data"),col.names = col_names)
col_names <- c("Sequence Name","mcg","gvh","alm","mit","erl","pox","vac","nuc","class")
summary(data1)
#a.Perform ANOVA test on the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins by class variables (Target).
library(lattice)
attach(sumcr)

test1 =aov(data1$nuc ~ data1$class , data1)
summary(test1)
#Ho = There is no relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins
#H1 = There is a relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins

##Findings
# Based on the pValue ,We fail to reject the null hypothesis and conlude that there is  no relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins 

#b. Which class is significantly different from others?

TukeyHSD(test1)
library(gplots)
plotmeans(nuc ~ class,xlab="Class",ylab="nuc",main="Mean plot",data = data1)
#ERL is signifficantly  different from the other classes
