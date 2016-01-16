library(stats)
library(psych)
library(foreign)
library(InformationValue)
library(caret)
train =  read.spss('/Users/gautamborgohain/Google Drive/Datasets/Caravan_train_0.sav',use.value.labels = FALSE,to.data.frame = TRUE)
test =  read.spss('/Users/gautamborgohain/Google Drive/Datasets/Caravan_test_0.sav',use.value.labels = FALSE,to.data.frame = TRUE)

#convert the categorical variables to dummy vars
dmy = dummyVars("~ .", data = train, fullRank = T)
new_train = data.frame(predict(dmy,newdata = train))
train = new_train

#logit_model = step(glm(CARAVAN ~ .,family = "binomial",data = train),direction = "backward")

logit_model<- glm(CARAVAN~PBRAND+PPERSAUT+APLEZIER+PBYSTAND+PTRACTOR+PPLEZIER+PWALAND+PWAPART,data = train,family = binomial(link = "logit"))
predicted = plogis(predict(logit_model,test,type = "response"))
optCutOff = optimalCutoff(test$CARAVAN,predicted)
#Performance
misClassError(test$CARAVAN,predicted,threshold = optCutOff)
plotROC(test$CARAVAN,predicted)
InformationValue::confusionMatrix(test$CARAVAN,predicted,threshold = 0.1)
InformationValue::specificity(test$CARAVAN,predicted,threshold = 0.1)
InformationValue::sensitivity(test$CARAVAN,predicted,threshold = 0.1)

