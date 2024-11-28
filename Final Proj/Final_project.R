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

ggplot(data = etAll, aes(x = score2024, y = log(GDP2024))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2024 Paris") +
  xlab("score: (20,7,5)") +
  ylab("log (GDP)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )

model <- lm(score2024 ~ log(GDP2024) + log(population2024), data=etAll)
summary(model)


autoplot(model) #畫出模型診斷的圖
shapiro.test(model$residual) #殘差項常態性檢定
require(model) #殘差項獨立性檢定
durbinWatsonTest(model) #殘差項獨立性檢定

