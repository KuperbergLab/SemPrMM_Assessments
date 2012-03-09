behav_save_df_stopit <- function(subjType){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/"
fileName <- paste(filePath,subjType,'_StopItResults',sep="")
data <- read.table(skip=1, fileName, header=FALSE)
stopitData.all <- data.frame(subj = factor(data$V1), acc=data$V2, ssrt=data$V3)

outFile <-paste(filePath,"R/",subjType,'_StopIt.df', sep="")
save(stopitData.all, file=outFile)

}
