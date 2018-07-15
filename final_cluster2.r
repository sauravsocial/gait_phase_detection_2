library(tidyverse)
library(caret)
library(xlsx)
library(cluster)
library(factoextra)
library(sqldf)
library(plotly)
library(plotrix)
gait_a = read.xlsx("D:/Downloads/Desktop/gait_datasets_used/cluster2_gait.xlsx",1)
gait_filter <- gait_a[164:9502,]
gait_b <- scale(gait_filter)
k_gait <- kmeans(gait_b, centers = 7, nstart = 25)
cluster_info <- str(k_gait) 
fviz_cluster(k_gait,data = gait_b)
#total = 9339
x<-k_gait$cluster
write.csv(x, file="D:/Downloads/Desktop/gait_datasets_used/cluster_result.csv")
cluster_gait <- read.csv("D:/Downloads/Desktop/gait_datasets_used/cluster_result.csv",1)
plot(cluster_gait$Index,cluster_gait$x, pch = 1, cex = 1, col = "blue", main = "Phase Classification", xlab = "Index", ylab = "phase")
