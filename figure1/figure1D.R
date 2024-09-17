library(ggplot2)
library(reshape2)
library(ggpubr)
library(ggsignif)
data <- readxl::read_xlsx("figure1d.xlsx")
data.melt <- melt(data, value.name = "Counts")

ggplot(data.melt, aes(variable, Counts, fill = variable))+
  geom_half_violin(position = position_nudge(x=0.1, y=0),
                   side = 'R',
                   adjust=1.2,
                   trim=F,
                   color=NA,
                   alpha=0.6)+
  geom_point(aes(y=Counts),position = position_jitter(width = 0.15, height = 0), size= 2, alpha= 0.6)+
  geom_signif(
    comparisons = list(c("Cluster1", "Cluster2")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(14, 14),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("Cluster1", "Cluster3")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(15, 15),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("Cluster1", "Cluster4")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(16, 16),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("Cluster1", "Cluster5")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(17, 17),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  theme_bw()+
  theme(
    panel.grid = element_blank(),
    axis.title = element_text(size = 14), 
    axis.text = element_text(size = 24)
  )
  
