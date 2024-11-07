
library(ggplot2)
library(GGally)

plot(etAll$score2024
     ,log(etAll$GDP2024),
     main = "2024",
     xlab = "score_percent",
     ylab = "GDP",
     col = "blue",
     pch = 19)

model <- lm(score2024 ~ log(GDP2024), data=etAll)
summary(model)


#install.packages("ape")
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)
autoplot(model) #畫出模型診斷的圖
shapiro.test(model$residual) #殘差項常態性檢定
#install.packages("car") 
require(car) #殘差項獨立性檢定
durbinWatsonTest(model) #殘差項獨立性檢定
