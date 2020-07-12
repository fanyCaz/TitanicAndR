setwd("C:/Users/Estefania Caceres/Proyectos/TitanicAndR")

# Install and load required packages for fancy decision tree plotting
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# What's in a name?
train$Name[1]

# Join together the test and train sets for easier feature engineering
test$Survived <- NA
combi <- rbind(train, test)


train$Name[1]

test$Survived <- NA
#combines the two datasets
combi <- rbind(trainOriginal,test)
combi$Name<-as.character(combi$Name)
combi$Name[1]
#Regular expression
strsplit(combi$Name[1],split="[,.]")[[1]][2]
strsplit(combi$Name,split="[,.]")[[1]][2]
#each row has the title applied with sapply
combi$Title<-sapply(combi$Name,FUN=function(x){strsplit(x,split = '[,.]')[[1]][2]})
combi$Title<-sub(' ','',combi$Title)
table(combi$Title)
#to every madame and mademoiselle , the same title is applied
#asks: if the title is in the temporary vector 'c' , then it is changed to Mlle
combi$Title[combi$Title %in% c('Mme','Mlle')]<-'Mlle'
combi$Title[combi$Title %in% c('Capt','Don','Major','Sir')]<-'Sir'
combi$Title[combi$Title %in% c('Dona','Lady','the Countess','Jonkheer')]<-'Lady'
combi$Title<-factor(combi$Title)
#Family Size