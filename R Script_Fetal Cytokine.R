###R script for Fetal Tissues Analysis

library(ComplexHeatmap)
library(circlize)

##Importing and scaling data. Raw data will be scaled (z-scored). Make sure all files are in working directory. 

cyt.data <- read.csv('Raw.csv') ##Reading in raw data file. 
cyt.matrix <- data.matrix(cyt.data) ##Converting to numeric matrix
cyt.matrix2 <- cyt.matrix[, -c(1)] ##To delete the first column (samples) 
heatmap(cyt.matrix2) ##Raw data heatmap
cyt.matrix_scaled <- scale(cyt.matrix2)
heatmap(cyt.matrix_scaled) ##Scaled heatmap


##Adding Column annotation (BoxPlot) to show spread of raw data.

ha1 <- HeatmapAnnotation(pg.mL = anno_boxplot(cyt.matrix2, height = unit(4, "cm"), box_width = 0.9, outline = FALSE))

Heatmap(cyt.matrix_scaled, top_annotation = ha1)


##Adding annotations to heatmep. This will include information in the meta data file (Tissue, Treatment, and Dam). 

meta.data <- read.csv('Metadata.csv')
meta.mat <- as.matrix(meta.data)
meta.mat <- meta.mat[, -c(1)]
Tissue.mat <- as.matrix(meta.mat[, -c(2,3)])
Treatment.mat <-as.matrix(meta.mat[,-c(1,3)])
Dam.mat <- as.matrix(meta.mat[,-c(1,2)])
ha2 = rowAnnotation(Dam = Dam.mat, 
                    Treatment = Treatment.mat,
                    Tissue = Tissue.mat,
                    col = list(Dam = c("r05055" = "Light Blue", "rh2786" = "Magenta", "rh2800" = "Black", "rh2936" = "Maroon", "rh3014" = "Orange", "rh3015" = "Gray", "rh3051" = "Purple"),
                               Tissue = c("Liver" = "Yellow", "Lung" = "Green", "Spleen" = "Brown", "Thymus" = "Pink"), 
                               Treatment = c("Saline" = "red", "Tisseel" = "Blue", "MCP1" = "Dark Green")
                    ))
Heatmap(cyt.matrix_scaled, top_annotation = ha1, left_annotation = ha2)

pdf(file = "~/Box/UW_Golos_PostDoc_Jessica Vazquez/Protein Assay/Fetal Tissues/Fetal Tissues Dams.pdf", width = 5, height = 5) ##Location and name of pdf file. Might need to modify plotting area.

Heatmap(cyt.matrix_scaled, top_annotation = ha1, left_annotation = ha2)

dev.off()
```