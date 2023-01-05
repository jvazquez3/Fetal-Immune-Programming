###Script to make plots for summary data from Specter.

###Using ggplot2

library(ggplot2)

###Find data file and make that working directory. Load data
data <-read.csv("sum.dataR.csv")
###To plot
ggplot(data = data, aes(Treatment, Percent.B.Cells, colour = Collection)) + geom_boxplot()
###To make multiple plots

Plot1 <- ggplot(data = data, aes(Treatment, Percent.B.Cells, colour = Collection)) + geom_boxplot() + ggtitle('B Cells') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot2 <- ggplot(data = data, aes(Treatment, Percent.CD4.T.cells, colour = Collection)) + geom_boxplot() + ggtitle('CD4 T Cells') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot3 <- ggplot(data = data, aes(Treatment, Percent.CD8.T.cells, colour = Collection)) + geom_boxplot() + ggtitle('CD8 T Cells') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot4 <- ggplot(data = data, aes(Treatment, Percent.Monocytes, colour = Collection)) + geom_boxplot() + ggtitle('Monocytes') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot6 <- ggplot(data = data, aes(Treatment, Percent.NK.cells, colour = Collection)) + geom_boxplot() + ggtitle('NKs') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot5 <- ggplot(data = data, aes(Treatment, Percent.RORyt..ILC, colour = Collection)) + geom_boxplot() + ggtitle('RORyt ILCs') + labs(y = "Percent of Total") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))

###To add all plots on one page. 
library(patchwork)
Plot1 + Plot2 + Plot3 + Plot4 + Plot5 + Plot6 + plot_annotation(title = 'Frequency of Major Immune Populations') + plot_layout(guides = 'collect') ###Adding title and one legend
  
Plot7 <- ggplot(data = data, aes(Treatment, Cells.B.Cells, colour = Collection)) + geom_boxplot() + ggtitle('B Cells') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot8 <- ggplot(data = data, aes(Treatment, Cells.CD4.T.Cells, colour = Collection)) + geom_boxplot() + ggtitle('CD4 T Cells') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot9 <- ggplot(data = data, aes(Treatment, Cells.CD8.T.cells, colour = Collection)) + geom_boxplot() + ggtitle('CD8 T Cells') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot10 <- ggplot(data = data, aes(Treatment, Cells.Monocytes, colour = Collection)) + geom_boxplot() + ggtitle('Monocytes') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot12 <- ggplot(data = data, aes(Treatment, Cells.NK.cells, colour = Collection)) + geom_boxplot() + ggtitle('NKs') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot11 <- ggplot(data = data, aes(Treatment, Cells.RORyt..ILC, colour = Collection)) + geom_boxplot() + ggtitle('RORyt ILCs') + labs(y = "Total Number") + theme_linedraw() + theme(axis.text = element_text(size = 20), plot.title = element_text(size = 24), legend.text = element_text(size = 16), legend.title = element_text(size = 20))
Plot7 + Plot8 + Plot9 + Plot10 + Plot11 + Plot12 + plot_annotation(title = 'Frequency of Major Immune Populations') + plot_layout(guides = 'collect')