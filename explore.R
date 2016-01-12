library(stats)
library(psych)
train =  read.spss('/Users/gautamborgohain/Google Drive/Datasets/Caravan_train_0.sav',use.value.labels = FALSE,to.data.frame = TRUE)
summary(train)
describe(train)

#For predicting CARAVAN
table(train$CARAVAN)
cor(train,train$CARAVAN)
cors[cors>0.1,]
table(train$MOSTYPE,train$CARAVAN)
sort(table(train$MOSTYPE,train$CARAVAN)[,2],decreasing = TRUE)
sort(table(train$PPERSAUT,train$CARAVAN)[,2],decreasing = TRUE)
subset(train,train$CARAVAN == 1,select = c("MOSTYPE","PBRAND"))


#For PBRAND

cors = data.frame(cor(train,train$PBRAND))

plot(density(train$PBRAND),sub = (paste("Skewness:", round(e1071::skewness(train$PBRAND),2))))
polygon(density(train$PBRAND), col="red")

boxplot(train$PBRAND)