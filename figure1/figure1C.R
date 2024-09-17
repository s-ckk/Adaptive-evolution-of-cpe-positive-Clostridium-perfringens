library(ggplot2)
data <- readxl::read_xlsx("figure1C.xlsx")
ggplot(data, aes(x = source, y = number, fill=location))+
  geom_bar(stat = "identity", position="stack")+
  theme_bw()