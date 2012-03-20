behav_save_df_stopit <- function(subjType, listPrefix){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/"
fileName1 <- paste(filePath,listPrefix,'_StopItResults',sep="")
data <- read.table(skip=1, fileName1, header=FALSE)
stopitData.all <- data.frame(subj = factor(data$V1), acc=data$V2, ssrt=data$V3)


outFile <-paste(filePath,"R/",listPrefix,'_StopIt.df', sep="")
save(stopitData.all, file=outFile)

}
