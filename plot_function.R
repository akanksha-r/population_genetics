
#### R funtion to plot various values e.g. Histograms, QQ-Plot, and Boxplots
## Input 1: Upper quantile=Values of upper quantile
## Input 2: Lower quantile=Values of lower quantile
## Number: maximum number of rows in the file 


protein_dynamics_plot <-function(upper_quantile,lower_quantile,number){
png(file = "histogram_Upper_Quantile.png")
na.omit(upper_quantile)
h1=hist(upper_quantile,breaks=100, col="grey", border="blue", xlab="Upper quartile", ylab="Protein half life", main="Histogram for Upper Quantile", xlim=c(0,number))
dev.off()
png(file = "histogram_Lower_Quantile.png")
na.omit(lower_quantile)
h2=hist(lower_quantile,breaks=100, col="grey", border="green", xlab="Upper quartile", ylab="Protein half life", main="Histogram for Lower Quantile", xlim=c(0,number))
dev.off()
png(file = "Q-Q_plot_Quantile.png")
qqplot(upper_quantile,lower_quantile,col="#006400",xlab="Upper_Quantile",ylab="lower_Quantile",main="QQ-plot")
abline(0,1, col="red")
dev.off()
png("boxplot.png")
boxplot(upper_quantile, lower_quantile, las2 = 2,names=c("Upper_Quantile","Lower_Quantile"), col = c("#99d8c9","#fdae6b"),ylab="Protein_half_life", main="BoxPlot for Protein half life")
dev.off()
}
