#set working directory
setwd("C:/Users/Estefania Caceres/Proyectos/data-sets/TitanicAndR")

str(train)
#[891 rows x 12 variables]

#factor . encode a vector (category and enumerated)

train<-read.csv("train.csv", stringsAsFactors = FALSE)
#table : runs through the vector and counts the occurrence of each value
table(train$Survived) #survived is bool
#0 1 (dead survived)
prop.table(table(train$Survived))

#this will create the column and put '0' in every row
test$Survived <- rep(0,418)

submit<-data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
#i have to explain where exactly put the file since the working directory isnt the same
write.csv(submit,file="C:\\Users\\Estefania Caceres\\Proyectos\\data-sets\\TitanicAndR\\theyallperish.csv",row.names = FALSE)
