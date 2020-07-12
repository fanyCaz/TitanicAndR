setwd("C:/Users/Estefania Caceres/Proyectos/data-sets/TitanicAndR")
#set datasets
#train has the complete data of 891 passengers
train<-read.csv("train.csv")
#test has the info of the rest(418), and we have to predict the survival percentage
test<-read.csv("test.csv")

#look gender patterns
summary(train$Sex)
#add second variable
#this divides against all the rows
prop.table(table(train$Sex, train$Survived))  #prop means by proportion
#this divides against the rows , but by column
#the 1 stands by dimension , in this case (rows aka x dimension)
prop.table(table(train$Sex,train$Survived),1)

test$Survived<-0
#filter the assigment , if the variable is equal to female, it assign 1 to the survived column
#we make them all female survived, because most of them were int the train(real data),
#and in the test we are trying to approach the truth
test$Survived[test$Sex == 'female'] <-1
#the '[]' creates a subset of the dataframe

#make the csv
submit<-data.frame(PassengerId=test$PassengerId,Survived=test$Survived)
write.csv(submit,file="genderrole.csv",row.names = FALSE)

#NA'S there's no data available, we have to assume (we must not)
summary(train$Age)

#create new variable to know if a person is infant
#we make this because in the Titanic the woman and children were first to survive
train$Child <- 0
train$Child[train$Age < 18] <- 1
prop.table(table(train$Age,train$Survived))

aggregate(Survived ~ Child + Sex,data=train, FUN= sum)
#this can be read as :
#adult females who survived 195
#infant females who survived 38... and so on