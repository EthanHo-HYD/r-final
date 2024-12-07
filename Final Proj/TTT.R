library(ggplot2)
library(GGally)
library(spData)
library(plm)
library(spdep)
library(ape)
library(dplyr)
library(ggfortify)

# ---------------------------------------------------------------------數據處理

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

total2024score <- 20 * total2024gold + 7 * total2024silver + 5 * total2024bronze
total2020score <- 20 * total2020gold + 7 * total2020silver + 5 * total2020bronze
total2016score <- 20 * total2016gold + 7 * total2016silver + 5 * total2016bronze

etAll$score2016percentage <- etAll$score2016 / total2016score * 100
etAll$score2020percentage <- etAll$score2020 / total2020score * 100
etAll$score2024percentage <- etAll$score2024 / total2024score * 100


# ---------------------------------------------------------------------繪製圖形（資訊可視化）


p1 <- ggplot(data = etAll, aes(x = score2016percentage, y = log10(GDP2016))) +
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

p2 <- ggplot(data = etAll, aes(x = score2020percentage, y = log10(GDP2020))) +
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

p3 <- ggplot(data = etAll, aes(x = score2024percentage, y = log10(GDP2024))) +
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

p4 <- ggplot(data = etAll, aes(x = score2016percentage, y = log10(population2016))) +
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

p5 <- ggplot(data = etAll, aes(x = score2020percentage, y = log10(population2020))) +
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

p6 <- ggplot(data = etAll, aes(x = score2024percentage, y = log10(population2024))) +
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


# ---------------------------------------------------------------線性回歸模型

model2024 <- lm(score2024percentage ~ log10(GDP2024) + log10(population2024), data=etAll)
summary(model2024)
autoplot(model2024) #畫出模型診斷的圖
shapiro.test(model2024$residual) #殘差項常態性檢定

model2020 <- lm(score2020percentage ~ log10(GDP2020) + log10(population2020), data=etAll)
summary(model2020)
autoplot(model2020) 
shapiro.test(model2020$residual)

model2016 <- lm(score2016percentage ~ log10(GDP2016) + log10(population2016), data=etAll)
summary(model2016)
autoplot(model2016) 
shapiro.test(model2016$residual) 



# -----------------------------------------------------------------CAGR 計算


etAll$GDPcagr <- ((etAll$GDP2024 / etAll$GDP2016) ^ 0.125 - 1) * 100
etAll$scorecagr <- ((etAll$score2024 / etAll$score2016) ^ 0.125 - 1) * 100

pp <- ggplot(data = etAll, aes( x = GDPcagr, y = scorecagr))+
  geom_point(color = "blue", shape = 20, size = 3) +  
  ggtitle("CAGR relation") +
  xlab("GDP_cagr") +
  ylab("score_cagr") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14)    
  )
ggsave("images/cagr.png", plot = pp)

modelcagr <- lm(scorecagr ~ GDPcagr, data = etAll)
summary(modelcagr)
autoplot(modelcagr) 
shapiro.test(modelcagr$residual)

