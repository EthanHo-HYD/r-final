library(ggplot2)
library(GGally)
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)

etAll <- data

etAll$score2016 <- 20 * etAll$gold2016 + 7 * etAll$silver2016 + 5 * etAll$bronze2016
etAll$score2020 <- 20 * etAll$gold2020 + 7 * etAll$silver2020 + 5 * etAll$bronze2020
etAll$score2024 <- 20 * etAll$gold2024 + 7 * etAll$silver2024 + 5 * etAll$bronze2024

plot(etAll$score2024
     ,log(etAll$GDP2024) ,
     main = "2024",
     xlab = "score_percent",
     ylab = "GDP",
     col = "blue",
     pch = 19)

model
model <- lm(score2024 ~ log(GDP2024)+log(pop2024), data=etAll)
summary(model)


install.packages("iris")

autoplot(model) #畫出模型診斷的圖
shapiro.test(model$residual) #殘差項常態性檢定
require(model) #殘差項獨立性檢定
durbinWatsonTest(model) #殘差項獨立性檢定

