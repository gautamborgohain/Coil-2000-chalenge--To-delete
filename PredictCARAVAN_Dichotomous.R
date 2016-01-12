logit_model = step(glm(CARAVAN ~ .,family = "binomial",data = train),direction = "backward")

logit_model<- glm(CARAVAN~PBRAND+PPERSAUT+APLEZIER+PBYSTAND+PTRACTOR+PPLEZIER+PWALAND+PWAPART,data = train,family = binomial(link = "logit"))
predicted = plogis(predict(logit_model,test,type = "response"))
optCutOff = optimalCutoff(test$CARAVAN,predicted)
#Performance
misClassError(test$CARAVAN,predicted,threshold = optCutOff)
plotROC(test$CARAVAN,predicted)
confusionMatrix(test$CARAVAN,predicted,threshold = 0.1)
specificity(test$CARAVAN,predicted,threshold = 0.1)
sensitivity(test$CARAVAN,predicted,threshold = 0.1)

