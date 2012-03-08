behav_save_df_stopit <- function(subjType){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/"
fileName <- paste(filePath,'StopItResults_',subjType,sep="")
data <- read.table(skip=1, fileName, header=FALSE)
stopitData.all <- data.frame(subj = factor(data$V1), cresp=data$V2, ssrt=data$V3)

outFile <-paste(filePath,"R/", 'StopIt','_',subjType, '_accuracy.df', sep="")
save(stopitData.all, file=outFile)

}
