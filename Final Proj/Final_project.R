library(ggplot2)
library(GGally)
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)

etAll <- data

plot(etAll$score2024
     ,log(etAll$GDP2024),
     main = "2024",
     xlab = "score_percent",
     ylab = "GDP",
     col = "blue",
     pch = 19)


model <- lm(score2024 ~ log(GDP2024)+log(pop2024), data=etAll)
summary(model)


#install.packages("ape")

autoplot(model) #畫出模型診斷的圖
shapiro.test(model$residual) #殘差項常態性檢定
require(model) #殘差項獨立性檢定
durbinWatsonTest(model) #殘差項獨立性檢定

