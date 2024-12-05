p1 <- ggplot(data = etAll, aes(x = GDPcagr, y = scorecagr)) +
  geom_point(color = "blue", shape = 20, size = 3) +
  ggtitle("CAGR") +
  xlab("GDP_CAGR") +
  ylab("score_CAGR") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14) 
  )
p1
