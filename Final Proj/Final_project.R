library(ggplot2)
library(GGally)
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)

etAll <- read.csv("Final Proj/data.csv")
etAll$index <- c(1:43)

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

etAll$GDPcagr <- ((etAll$GDP2024 / etAll$GDP2016) ^ 0.125 - 1) * 100
etAll$scorecagr <- ((etAll$score2024 / etAll$score2016) ^ 0.125 - 1) * 100
etAll$populationcagr <- ((etAll$population2024 / etAll$population2016) ^ 0.125 - 1) * 100

total2024score <- 20 * total2024gold + 7 * total2024silver + 5 * total2024bronze
total2020score <- 20 * total2020gold + 7 * total2020silver + 5 * total2020bronze
total2016score <- 20 * total2016gold + 7 * total2016silver + 5 * total2016bronze

etAll$score2016percentage <- etAll$score2016 / total2016score * 100
etAll$score2020percentage <- etAll$score2020 / total2020score * 100
etAll$score2024percentage <- etAll$score2024 / total2024score * 100

etAll$score2016log <- log10(etAll$score2016)
etAll$score2020log <- log10(etAll$score2020)
etAll$score2024log <- log10(etAll$score2024)

etAll$population2016log <- log10(etAll$population2016)
etAll$population2020log <- log10(etAll$population2020)
etAll$population2024log <- log10(etAll$population2024)

etAll$GDP2016log <- log10(etAll$GDP2016)
etAll$GDP2020log <- log10(etAll$GDP2020)
etAll$GDP2024log <- log10(etAll$GDP2024)

modelA <- lm(score2020percentage ~ GDP2020log, data=etAll)
summary(modelA)
autoplot(modelA)
shapiro.test(modelA$residual)

modelB <- lm(score2024percentage ~ population2024log, data=etAll)
summary(modelB)
autoplot(modelB)
shapiro.test(modelB$residual)

modelC <- lm(scorecagr ~ GDPcagr, data=etAll)
summary(modelC)
autoplot(modelC)
shapiro.test(modelC$residual)

model2016 <- lm(score2016 ~ GDP2016 + population2016, data=etAll)
summary(model2016)
autoplot(model2016)
shapiro.test(model2016$residual)

model2020 <- lm(score2020 ~ GDP2020 + population2020, data=etAll)
summary(model2020)
autoplot(model2020)
shapiro.test(model2020$residual)

model2024 <- lm(score2024 ~ GDP2024 + population2024, data=etAll)
summary(model2024)
autoplot(model2024)
shapiro.test(model2024$residual)
