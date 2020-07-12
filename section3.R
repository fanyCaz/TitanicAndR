setwd("C:/Users/Estefania Caceres/Proyectos/TitanicAndR")
#Recursive Partitioning and Regression Trees -> library
#this uses CART(Classification And Regression Trees)
library(rpart)
library(rattle)
library(RColorBrewer)
library(rpart.plot)
#in the fit object, uses the Survived bool , with the decision variables:
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
             data=train,
             method="class",
             control = rpart.control(minsplit = 2,cp=0))
plot(fit)
text(fit)
fancyRpartPlot(fit)
Prediction<-predict(fit,test,type="class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "controlledvariables.csv", row.names = FALSE)
cvls<-read.csv("controlledvariables.csv")
#Overfitting: too many decision variables, and too many specific combinations
prop.table(table(cvls$Survived))
