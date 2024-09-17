library(ggplot2)
data <- readxl::read_xlsx("figureS6.xlsx")
library(reshape2)
data.melt = melt(data, value.name = "Counts")

ggplot(data.melt, aes(x = variable, y = Counts, fill = level)) +
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") +  # 确保只有一个facet_wrap
  theme_bw() +
  labs(x = "Cluster", y = "Number of genes") +
  theme(
    axis.text.x = element_text(size = 10),  
    axis.text.y = element_text(size = 10),  
    axis.title = element_text(size = 14)
  )
