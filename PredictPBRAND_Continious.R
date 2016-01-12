

pbrand_model = lm(PBRAND~PWAPART+AWAPART+PWALAND+AWALAND+PTRACTOR+ATRACTOR+MHKOOP+MHHUUR+ALEVEN,data = train)
summary(pbrand_model)
predicted_list = predict(pbrand_model,test)
pbrand_predicts <- data.frame(cbind(test$PBRAND,predicted_list))
cor(pbrand_predicts)

confint(pbrand_model)
fitted(pbrand_model)
plot(pbrand_model)

#pbrand_model= step(lm(PBRAND~PWAPART+AWAPART+PWALAND+AWALAND+PTRACTOR+ATRACTOR+MHKOOP+MHHUUR+ALEVEN,data = train),direction = "both")
train$MOSHOOFD<-factor(train$MOSHOOFD)
train$MOSTYPE<-factor(train$MOSTYPE)
#Stepwise forward:step(lm(PBRAND~1,data = train),direction = "forward",scope = ~PWAPART+AWAPART+PWALAND+AWALAND+PTRACTOR+ATRACTOR+MHKOOP+MHHUUR+ALEVEN)
