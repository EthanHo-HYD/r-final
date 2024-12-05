library(ggplot2)
library(GGally)
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)

#etAll <- data
etAll <- read.csv("Final Proj/data.csv")

etAll$index <- c(1:45)

etAll$score2016 <- 20 * etAll$gold2016 + 7 * etAll$silver2016 + 5 * etAll$bronze2016
etAll$score2020 <- 20 * etAll$gold2020 + 7 * etAll$silver2020 + 5 * etAll$bronze2020
etAll$score2024 <- 20 * etAll$gold2024 + 7 * etAll$silver2024 + 5 * etAll$bronze2024

total2024gold = 329
total2024silver = 330
total2024bronze = 385

total2020gold = 340
total2020silver = 338
total2020bronze = 402

total2016gold = 306
total2016silver = 307
total2016bronze = 359

total2024score <- 20 * total2024gold + 7 * total2024silver + 5 * total2024bronze
total2020score <- 20 * total2020gold + 7 * total2020silver + 5 * total2020bronze
total2016score <- 20 * total2016gold + 7 * total2016silver + 5 * total2016bronze

etAll$score2016percentage <- etAll$score2016 / total2016score * 100
etAll$score2020percentage <- etAll$score2020 / total2020score * 100
etAll$score2024percentage <- etAll$score2024 / total2024score * 100

modelA <- lm(score2024 ~ log10(GDP2024), data=etAll)
summary(modelA)
modelB <- lm(score2024 ~ log10(population2024), data=etAll)
summary(modelB)
modelC <- lm(score2024 ~ log10(GDP2024) + log10(population2024), data=etAll)
summary(modelC)

# autoplot(model) #畫出模型診斷的圖
# shapiro.test(model$residual) #殘差項常態性檢定
