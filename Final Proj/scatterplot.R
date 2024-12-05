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
