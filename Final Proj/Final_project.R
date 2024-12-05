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

p1 <- ggplot(data = etAll, aes(x = score2016percentage, y = log(GDP2016))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2016 Rio") +
  xlab("score percentage") +
  ylab("log (GDP)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2016score_gdp.png", plot = p1)

p2 <- ggplot(data = etAll, aes(x = score2020percentage, y = log(GDP2020))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2020 Tokyo") +
  xlab("score percentage") +
  ylab("log (GDP)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2020score_gdp.png", plot = p2)

p3 <- ggplot(data = etAll, aes(x = score2024percentage, y = log(GDP2024))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2024 Paris") +
  xlab("score percentage") +
  ylab("log (GDP)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2024score_gdp.png", plot = p3)

p4 <- ggplot(data = etAll, aes(x = score2016percentage, y = log(population2016))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2016 Rio") +
  xlab("score percentage") +
  ylab("log (population)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2016score_population.png", plot = p4)

p5 <- ggplot(data = etAll, aes(x = score2020percentage, y = log(population2020))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2020 Tokyo") +
  xlab("score percentage") +
  ylab("log (population)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2020score_population.png", plot = p5)

p6 <- ggplot(data = etAll, aes(x = score2024percentage, y = log(population2024))) +
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("2024 Paris") +
  xlab("score percentage") +
  ylab("log (population)") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/2024score_population.png", plot = p6)


model <- lm(score2024 ~ log(GDP2024) + log(population2024), data=etAll)
summary(model)

autoplot(model) #畫出模型診斷的圖
shapiro.test(model$residual) #殘差項常態性檢定