library(ggplot2)
library(reshape2)

# 数据框创建
data <- data.frame(
  gene = c("plc", "cpb", "etx", "iap/ibp", "cpe", "cpb2", "pfoA", "cloSI", "colA", 
           "nagH", "nagI", "nagJ", "nagK", "nagL", "nanH", "nanI", "nanJ"),
  cluster1 = c(1, 0.023809524, 0, 0, 1, 0.023809524, 0, 1, 0.952380952, 
               0.130952381, 0, 0.19047619, 0, 0.154761905, 1, 0.011904762, 0.19047619),
  cluster2_5 = c(1, 0, 0.045226131, 0.075376884, 1, 0.120603015, 0.909547739, 
                 1, 1, 1, 0.964824121, 1, 0.959798995, 0.91959799, 1, 0.929648241, 1)
)

# 转换数据框格式
data_melt <- melt(data, id.vars = "gene", variable.name = "cluster", value.name = "value")

# 绘制分组柱状图
ggplot(data_melt, aes(x = cluster, y = value, fill = cluster)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~gene, scales = "free_x") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(x = "Cluster",
       y = "Prevalence") +
  scale_fill_manual(values = c("cluster1" = "blue", "cluster2_5" = "red"))+theme_bw()
