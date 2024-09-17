library(ggplot2)
library(pheatmap)
data <- read.delim("figureS5.txt", row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
ann_colors =list(level = c(clu1 = "#1f77b4", clu2 = "#ff7f0e", clu3 = "#2ca02c", clu4 = "#d62728", clu5 = "#9467bd"))
zhushi<-read.table("zhushi.txt",header=T,sep="\t",row.names=1)
annotation_row <- as.data.frame(zhushi) 
pheatmap(data, annotation_row = annotation_row, 
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.04, cellheight = 1, color = colorRampPalette(c("white", "#9467bd"))(100), annotation_colors = ann_colors)
