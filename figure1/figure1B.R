library(ggplot2)
data <- readxl::read_xlsx("figure1B.xlsx")
#堆叠柱状图
ggplot(data, aes(x = source, y = number, fill=species))+
  geom_bar(stat = "identity", position=position_dodge(1))+
  theme_bw()