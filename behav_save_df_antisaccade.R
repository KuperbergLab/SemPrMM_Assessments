behav_save_df_antisaccade <- function(subjType, listPrefix){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/"
fileName <- paste(filePath, "R/",listPrefix,'_AntiSacc_long',sep="")
data <- read.table(skip=1, fileName, header=FALSE)
antiData.all <- data.frame(subj = factor(data$V1), cond = factor(data$V2), acc=data$V3, rt=data$V4)

outFile <-paste(filePath,"R/",listPrefix,'_AntiSaccade_accuracy.df', sep="")
save(antiData.all, file=outFile)

}
