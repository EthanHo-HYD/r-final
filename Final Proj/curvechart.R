p1 <- ggplot(data = etAll, aes(x = index, group = 1)) +
  geom_line(aes(y = GDP2016), color = "blue") +
  geom_line(aes(y = GDP2020), color = "brown") +
  geom_line(aes(y = GDP2024), color = "burlywood") +
  geom_line(aes(y = population2016), color = "cadetblue") +
  geom_line(aes(y = population2020), color = "chartreuse") +
  geom_line(aes(y = population2024), color = "chocolate") +
  geom_line(aes(y = score2016percentage), color = "coral") +
  geom_line(aes(y = score2020percentage), color = "cornflowerblue") +
  geom_line(aes(y = score2024percentage), color = "purple") +
  geom_point(aes(y = GDP2016), color = "blue", size = 3) +
  geom_point(aes(y = GDP2020), color = "brown", size = 3) +
  geom_point(aes(y = GDP2024), color = "burlywood", size = 3) +
  geom_point(aes(y = population2016), color = "cadetblue", size = 3) +
  geom_point(aes(y = population2020), color = "chartreuse", size = 3) +
  geom_point(aes(y = population2024), color = "chocolate", size = 3) +
  geom_point(aes(y = score2016percentage), color = "coral", size = 3) +
  geom_point(aes(y = score2020percentage), color = "cornflowerblue", size = 3) +
  geom_point(aes(y = score2024percentage), color = "purple", size = 3) +
  ggtitle("RawData") +
  xlab("States") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14),
    axis.text.x = element_blank(),
    axis.title.y = element_blank(),
    aspect.ratio = 0.5
  )
ggsave("images/rowdata.png", plot = p1)

p2 <- ggplot(data = etAll, aes(x = index, group = 1)) +
  geom_line(aes(y = log10(GDP2016)), color = "blue") +
  geom_line(aes(y = log10(GDP2020)), color = "brown") +
  geom_line(aes(y = log10(GDP2024)), color = "burlywood") +
  geom_line(aes(y = log10(population2016)), color = "cadetblue") +
  geom_line(aes(y = log10(population2020)), color = "chartreuse") +
  geom_line(aes(y = log10(population2024)), color = "chocolate") +
  geom_line(aes(y = score2016percentage), color = "coral") +
  geom_line(aes(y = score2020percentage), color = "cornflowerblue") +
  geom_line(aes(y = score2024percentage), color = "purple") +
  geom_point(aes(y = log10(GDP2016)), color = "blue", size = 3) +
  geom_point(aes(y = log10(GDP2020)), color = "brown", size = 3) +
  geom_point(aes(y = log10(GDP2024)), color = "burlywood", size = 3) +
  geom_point(aes(y = log10(population2016)), color = "cadetblue", size = 3) +
  geom_point(aes(y = log10(population2020)), color = "chartreuse", size = 3) +
  geom_point(aes(y = log10(population2024)), color = "chocolate", size = 3) +
  geom_point(aes(y = score2016percentage), color = "coral", size = 3) +
  geom_point(aes(y = score2020percentage), color = "cornflowerblue", size = 3) +
  geom_point(aes(y = score2024percentage), color = "purple", size = 3) +
  ggtitle("LogData") +
  xlab("States") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14),
    axis.text.x = element_blank(),
    axis.title.y = element_blank(),
    aspect.ratio = 0.5
  )
ggsave("images/logdata.png", plot = p2)
