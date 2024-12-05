years <- 4
cagr <- ((GDP2024 / GDP2020)^(1 / years) - 1) * 100
cat("從2020到2024的各國GDP複合成長率為:", round(cagr, 2), "%\n")

years <- 4
cagr <- ((GDP2020 / GDP2016)^(1 / years) - 1) * 100
cat("從2016到2020的各國GDP複合成長率為:", round(cagr, 2), "%\n")

years <- 4
cagr <- ((total2024score / total2020score)^(1 / years) - 1) * 100
cat("從2020到2024的各國奧運積分複合成長率為:", round(cagr, 2), "%\n")

years <- 4
cagr <- ((total2020score / total2016score)^(1 / years) - 1) * 100
cat("從2016到2020的各國奧運積分複合成長率為:", round(cagr, 2), "%\n")
