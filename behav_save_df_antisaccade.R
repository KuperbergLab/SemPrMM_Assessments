behav_save_df_antisaccade <- function(subjType){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/"
fileName <- paste(filePath,'longOut',subjType,sep="")
data <- read.table(skip=1, fileName, header=FALSE)
antiData.all <- data.frame(subj = factor(data$V1), condn = factor(data$V2), acc=data$V3, rt=data$V4)

outFile <-paste(filePath,"R/", 'AntiSaccade','_',subjType, '_accuracy.df', sep="")
save(antiData.all, file=outFile)

}
