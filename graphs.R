# This function will provide the hisograms(upper & lower quantile), QQ-plot, p-value and boxplots,  #
# For the values of protein dynamics for corresponding coding and noncoding constrains cutoffs      #
# This code assumes that the Coding score is such that genes with higher score are more essential   #

graphs <- function(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,
                    nc_upperthr,nc_lowerthr, codingThr, Upper_quantLabel, Lower_quantLabel, targetcolumnName){
  
  # discard all genes that are tolerant in coding score (with coding score less that CodingScoreThr)  #
  overall_file = subset(overall_file,overall_file[CodingScoreLabel]>codingThr,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score on basis of quantiles  #
  quant_upperThr=quantile(overall_file[nCscorelabel], na.rm=T, nc_upperthr)
  quant_lowerThr=quantile(overall_file[nCscorelabel],na.rm=T,nc_lowerthr)
  subset_upper=subset(overall_file,overall_file[nCscorelabel]>quant_upperThr ,na.rm=T)
  subset_lower=subset(overall_file,overall_file[nCscorelabel]<quant_lowerThr ,na.rm=T)
  
  
  
  # maximum value retrieval #
  xlab_val=max(as.vector(subset_upper[,targetcolumnLabel]),as.vector(subset_lower[,targetcolumnLabel]),na.rm=T)
  
  
  # histogram for Upper Quantile  #
  png(file =sprintf("Histogram_for_%s.png",Upper_quantLabel))
  h1=hist(na.omit(subset_upper[,targetcolumnLabel]), breaks=25,
          col="grey", border="red", xlab=sprintf(Upper_quantLabel),
          ylab=sprintf(targetcolumnName), main=sprintf("Histogram for %s with %s>%s and \n %s with %s Quantile",
                                                       targetcolumnName,nCscorelabel,codingThr,nCscorelabel,nc_upperthr), xlim=c(0,xlab_val))
  dev.off()
 
  # histogarm for Lower Quantile  #
  png(file = sprintf("Histogram_for_%s.png",Lower_quantLabel))
  
  h2=hist(na.omit(subset_lower[,targetcolumnLabel]), breaks=25,
          col="grey", border="#756bb1", xlab=sprintf(Lower_quantLabel),
          ylab=sprintf(targetcolumnName), main=sprintf("Histogram for %s with %s>%s and \n %s with %s Quantile",
                                                       targetcolumnName,CodingScoreLabel,codingThr,nCscorelabel,nc_lowerthr), xlim=c(0,xlab_val))
  dev.off()
  
  # p-value retrieval #
  data1=c(subset_upper[,targetcolumnLabel],subset_lower[,targetcolumnLabel])
  p_val=wilcox.test(subset_upper[,targetcolumnLabel],subset_lower[,targetcolumnLabel],
                    data=data1, header=TRUE)$p.value
  
  
  # Q-Q between upper and lower quantile  #
  png(file = sprintf("Q-Q_plot_for_%s.png",targetcolumnName))
  qqplot(subset_upper[,targetcolumnLabel],subset_lower[,targetcolumnLabel],
         col="#808080",xlab=sprintf(Upper_quantLabel),ylab=sprintf(Lower_quantLabel),
         main=sprintf("QQ-plot for %s with %s>%s and \n %s and %s Quantiles of %s with %s pvalue",
                      targetcolumnName,CodingScoreLabel,codingThr,nc_lowerthr,nc_upperthr,nCscorelabel,round(p_val,3)))
  abline(0,1, col="red")
  dev.off()
  
  # BoxPlot between upper and lower quantile  #
  png(file=sprintf("Boxplot_for_%s.png",targetcolumnName))
  boxplot(subset_upper[,targetcolumnLabel], subset_lower[,targetcolumnLabel], 
          las2 = 2,names=c(sprintf(Upper_quantLabel),sprintf(Lower_quantLabel)), 
          col = c("#9ecae1","#fa9fb5"),ylab=sprintf(targetcolumnName), 
          main=sprintf("BoxPlot for %s with %s>%s and \n %s and %s Quantiles of %s",targetcolumnName,CodingScoreLabel,codingThr,nc_lowerthr,nc_upperthr,nCscorelabel))
  dev.off()
}

# This function will provide the hisograms(upper & lower quantile), QQ-plot, p-value and boxplots,      #
# For the LOGARITHMIC values protein dynamics for corresponding coding and noncoding constrains cutoffs #
# This code assumes that the Coding score is such that genes with higher score are more essential       #


graphs_log <- function(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,
                   nc_upperthr,nc_lowerthr, codingThr, Upper_quantLabel, Lower_quantLabel, targetcolumnName){
  
  # discard all genes that are tolerant in coding score (with coding score less that CodingScoreThr)
  overall_file = subset(overall_file,overall_file[CodingScoreLabel]>codingThr,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score 
  quant_upperThr=quantile(overall_file[nCscorelabel], na.rm=T, nc_upperthr)
  quant_lowerThr=quantile(overall_file[nCscorelabel],na.rm=T,nc_lowerthr)
  subset_upper=subset(overall_file,overall_file[nCscorelabel]>quant_upperThr ,na.rm=T)
  subset_lower=subset(overall_file,overall_file[nCscorelabel]<quant_lowerThr ,na.rm=T)
  
  log_upper_subset=log10(subset_upper[,targetcolumnLabel])
  log_lower_subset=log10(subset_lower[,targetcolumnLabel])
  
  # maximum value retrieval #
  xlab_val=max(as.vector(log_upper_subset),as.vector(log_lower_subset),na.rm=T)
  
  
  # histogram for Upper Quantile  #
  png(file =sprintf("Histogram_for log_%s.png",Upper_quantLabel))
  
  h1=hist(na.omit(log_upper_subset), breaks=25,
          col="grey", border="blue", xlab=sprintf(Upper_quantLabel),
          ylab=sprintf(targetcolumnName), main=sprintf("Histogram for %s with %s>%s and \n %s with %s Quantile",
                                                       targetcolumnName,nCscorelabel,codingThr,nCscorelabel,nc_upperthr), xlim=c(0,xlab_val))
  dev.off()
 
  # histogarm for Lower Quantile  #
  png(file = sprintf("Histogram_forlog _%s.png",Lower_quantLabel))
  
  h2=hist(na.omit(log_lower_subset), breaks=25,
          col="grey", border="green", xlab=sprintf(Lower_quantLabel),
          ylab=sprintf(targetcolumnName), main=sprintf("Histogram for %s with %s>%s and \n %s with %s Quantile",
                                                       targetcolumnName,CodingScoreLabel,codingThr,nCscorelabel,nc_lowerthr), xlim=c(0,xlab_val))
  dev.off()
  
  # p-value retrieval #
  data1=c(subset_upper[,targetcolumnLabel],subset_lower[,targetcolumnLabel])
  p_val=wilcox.test(subset_upper[,targetcolumnLabel],subset_lower[,targetcolumnLabel],
                    data=data1, header=TRUE)$p.value
  
  
  # Q-Q between upper and lower quantile  #
  png(file = sprintf("Q-Q_plot_for_log_%s.png",targetcolumnName))
  qqplot(log_upper_subset,log_lower_subset,
         col="#808080",xlab=sprintf(Upper_quantLabel),ylab=sprintf(Lower_quantLabel),
         main=sprintf("QQ-plot for %s with %s>%s and \n %s and %s Quantiles of %s with %s pvalue",
                      targetcolumnName,CodingScoreLabel,codingThr,nc_lowerthr,nc_upperthr,nCscorelabel,round(p_val,3)))
  abline(0,1, col="red")
  dev.off()
  
  # Boxplot between upper and lower quantile  #
  png(file=sprintf("Boxplot_for_log_%s.png",targetcolumnName))
  boxplot(log_upper_subset,log_lower_subset, 
          las2 = 2,names=c(sprintf(Upper_quantLabel),sprintf(Lower_quantLabel)), 
          col = c("#99d8c9","#fdae6b"),ylab=sprintf(targetcolumnName), 
          main=sprintf("BoxPlot for %s with %s>%s and \n %s and %s Quantiles of %s",targetcolumnName,CodingScoreLabel,codingThr,nc_lowerthr,nc_upperthr,nCscorelabel))
  dev.off()
}

# This function will provide the QQ-plots for upper and lower threshold of coding constrains        #
# This code assumes that the Coding score is such that genes with higher score are more essential   #
# while with lower coding score is non-essential                                                    #

graphs_combine <- function(all_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,
                           nc_upperthr,nc_lowerthr, u_codingThr,l_codingThr, Upper_quantLabel, Lower_quantLabel, targetcolumnName){
 
  
  # discard all genes that are tolerant in coding score (with coding score less that CodingScoreThr) with upper and lower thresholds  #
  overall_file_u = subset(all_file,all_file[CodingScoreLabel]>u_codingThr,na.rm=T)
  overall_file_l = subset(all_file,all_file[CodingScoreLabel]<l_codingThr,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score for both upper thresholds  #
  quant_upperThr_u=quantile(overall_file_u[nCscorelabel], na.rm=T, nc_upperthr)
  quant_lowerThr_u=quantile(overall_file_u[nCscorelabel],na.rm=T,nc_lowerthr)
  subset_upper_u=subset(overall_file_u,overall_file_u[nCscorelabel]>quant_upperThr_u ,na.rm=T)
  subset_lower_u=subset(overall_file_u,overall_file_u[nCscorelabel]<quant_lowerThr_u ,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score for both lower thresholds  #
  quant_upperThr_l=quantile(overall_file_l[nCscorelabel], na.rm=T, nc_upperthr)
  quant_lowerThr_l=quantile(overall_file_l[nCscorelabel],na.rm=T,nc_lowerthr)
  subset_upper_l=subset(overall_file_l,overall_file_l[nCscorelabel]>quant_upperThr_l ,na.rm=T)
  subset_lower_l=subset(overall_file_l,overall_file_l[nCscorelabel]<quant_lowerThr_l ,na.rm=T)
  
  # Q-Q between upper and lower quantile with upper threshold of coding constrain #
  
  data1=c(log10(subset_upper_u[,targetcolumnLabel]),log10(subset_lower_u[,targetcolumnLabel]))
  p_val_u=wilcox.test(log10(subset_upper_u[,targetcolumnLabel]),log10(subset_lower_u[,targetcolumnLabel]),
                      data=data1, header=TRUE)$p.value
  
  png(file = sprintf("Q-Q_plot_for_%s_9_log.png",targetcolumnName))
  qqplot(log10(subset_upper_u[,targetcolumnLabel]),log10(subset_lower_u[,targetcolumnLabel]),
         col="#808080",xlab=sprintf(Upper_quantLabel),ylab=sprintf(Lower_quantLabel),
         main=sprintf("QQ-plot for %s with %s>%s and \n %s and %s Quantiles of %s with p-value %s",
                      targetcolumnName,CodingScoreLabel,u_codingThr,nc_lowerthr,nc_upperthr,nCscorelabel, round(p_val_u,digits=2)))
  abline(0,1, col="red")
  dev.off()
  
  data1=c(log10(subset_upper_l[,targetcolumnLabel]),log10(subset_lower_l[,targetcolumnLabel]))
  p_val_l=wilcox.test(log10(subset_upper_l[,targetcolumnLabel]),log10(subset_lower_l[,targetcolumnLabel]),
                    data=data1, header=TRUE)$p.value
  
  # Q-Q between upper and lower quantile with lower threshold of coding constrain #
  png(file = sprintf("Q-Q_plot_for_%s_1_log.png",targetcolumnName))
  qqplot(subset_upper_l[,targetcolumnLabel],subset_lower_l[,targetcolumnLabel],
         col="blue",xlab=sprintf(Upper_quantLabel),ylab=sprintf(Lower_quantLabel),
         main=sprintf("QQ-plot for %s with %s<%s and \n %s and %s Quantiles of %s with p-value %s",
                      targetcolumnName,CodingScoreLabel,l_codingThr,nc_lowerthr,nc_upperthr,nCscorelabel,round(p_val_l,digits=2)))
  abline(0,1, col="red")
  dev.off()
  
  # BoxPlot between upper and lower quantile p>0.9 #
  png(file=sprintf("Boxplot_for_%s_9_log.png",targetcolumnName))
  boxplot(log10(subset_upper_l[,targetcolumnLabel]), log10(subset_lower_l[,targetcolumnLabel]), 
          las2 = 2,names=c(sprintf(Upper_quantLabel),sprintf(Lower_quantLabel)), 
          col = c("#9ecae1","#fa9fb5"),ylab=sprintf(targetcolumnName), 
          main=sprintf("BoxPlot for %s with %s>%s and \n %s and %s Quantiles of %s",targetcolumnName,CodingScoreLabel,u_codingThr,nc_lowerthr,nc_upperthr,nCscorelabel))
  dev.off()
  
  # BoxPlot between upper and lower quantile p<0.1 #
  png(file=sprintf("Boxplot_for_%s_1_log.png",targetcolumnName))
  boxplot(log10(subset_upper_u[,targetcolumnLabel]), log10(subset_lower_u[,targetcolumnLabel]), 
          las2 = 2,names=c(sprintf(Upper_quantLabel),sprintf(Lower_quantLabel)), 
          col = c("#9ecae1","#fa9fb5"),ylab=sprintf(targetcolumnName), 
          main=sprintf("BoxPlot for %s with %s>%s and \n %s and %s Quantiles of %s",targetcolumnName,CodingScoreLabel,l_codingThr,nc_lowerthr,nc_upperthr,nCscorelabel))
  dev.off()
}


# This function will provide the QQ-plots for upper and lower threshold of coding constrains        #
# This code assumes that the Coding score is such that genes with higher score are more essential   #
# while with lower coding score is non-essential                                                    #

graphs_combine_1 <- function(all_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,
                          u_codingThr,l_codingThr, Upper_quantLabel, Lower_quantLabel, targetcolumnName){
  
  
  # discard all genes that are tolerant in coding score (with coding score less that CodingScoreThr) with upper and lower thresholds  #
  overall_file_u = subset(all_file,all_file[CodingScoreLabel]>u_codingThr,na.rm=T)
  overall_file_l = subset(all_file,all_file[CodingScoreLabel]<l_codingThr,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score for both upper thresholds  #
  # quant_upperThr_u=quantile(overall_file_u[nCscorelabel], na.rm=T, nc_upperthr)
  # quant_lowerThr_u=quantile(overall_file_u[nCscorelabel],na.rm=T,nc_lowerthr)
  # subset_upper_u=subset(overall_file_u,overall_file_u[nCscorelabel]>quant_upperThr_u ,na.rm=T)
  # subset_lower_u=subset(overall_file_u,overall_file_u[nCscorelabel]<quant_lowerThr_u ,na.rm=T)
  
  # break the remaining genes in two groups based on noncoding score for both lower thresholds  #
  # quant_upperThr_l=quantile(overall_file_l[nCscorelabel], na.rm=T, nc_upperthr)
  # quant_lowerThr_l=quantile(overall_file_l[nCscorelabel],na.rm=T,nc_lowerthr)
  # subset_upper_l=subset(overall_file_l,overall_file_l[nCscorelabel]>quant_upperThr_l ,na.rm=T)
  # subset_lower_l=subset(overall_file_l,overall_file_l[nCscorelabel]<quant_lowerThr_l ,na.rm=T)
  
  # Q-Q between upper and lower quantile with upper threshold of coding constrain #
  
  data1=c(log10(overall_file_u[,targetcolumnLabel]),log10(overall_file_l[,targetcolumnLabel]))
  p_val_u=wilcox.test(log10(overall_file_u[,targetcolumnLabel]),log10(overall_file_l[,targetcolumnLabel]),
                      data=data1, header=TRUE)$p.value
  
  png(file = sprintf("Q-Q_plot_for_tolerant_vs_in-tolerant_log.png",targetcolumnName))
  qqplot(log10(overall_file_u[,targetcolumnLabel]),log10(overall_file_l[,targetcolumnLabel]),
         col="#808080",xlab=sprintf(Upper_quantLabel),ylab=sprintf(Lower_quantLabel),
         main=sprintf("QQ-plot for %s for tolerant and intolerant genes \n with p-value %s",
                      targetcolumnName, round(p_val_u,digits=2)))
  abline(0,1, col="red")
  dev.off()
  
  
  # BoxPlot between upper and lower quantile p>0.9 #
  png(file=sprintf("Boxplot_for_%s_9_log.png",targetcolumnName))
  boxplot(log10(overall_file_u[,targetcolumnLabel]), log10(overall_file_l[,targetcolumnLabel]), 
          las2 = 2,names=c(sprintf(Upper_quantLabel),sprintf(Lower_quantLabel)), 
          col = c("#9ecae1","#fa9fb5"),ylab=sprintf(targetcolumnName), 
          main=sprintf("BoxPlot for %s for tolerant and non-tolerant genes",targetcolumnName))
  dev.off()
  
}

