library(stats)
library(psych)
library(foreign)
library(ggplot2)
train =  read.spss('/Users/gautamborgohain/Google Drive/Datasets/Caravan_train_0.sav',use.value.labels = FALSE,to.data.frame = TRUE)
test =  read.spss('/Users/gautamborgohain/Google Drive/Datasets/Caravan_test_0.sav',use.value.labels = FALSE,to.data.frame = TRUE)
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

qplot(PBRAND,PWAPART, data = new_train)
ggplot(new_train,aes(x=PBRAND, y= PWAPART))+geom_line()+geom_jitter()
hist(new_train$PBRAND, bins = 8)
barplot(new_train$PBRAND)
ggplot(data = new_train, aes(x= PBRAND))+geom_histogram(binwidth = 1)
boxplot(new_train$PBRAND)

plot = ggplot(data = new_train, aes(x= PBRAND,y = PWAPART))
color = ifelse(new_train$CARAVAN == 1,'black','white')
plot+ geom_jitter(col = color)


pl = ggplot(data = new_train,aes(x= PBRAND,y= PWAPART))
pl+geom_bar(fill = color,stat ="identity")



#For PBRAND

cors = data.frame(cor(train,train$PBRAND))

plot(density(train$PBRAND),sub = (paste("Skewness:", round(e1071::skewness(train$PBRAND),2))))
polygon(density(train$PBRAND), col="red")

boxplot(train$PBRAND)