get_subjectList <- function(subjType, task){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/"
fileName <- paste(filePath,subjType,'.',task, '.all.txt',sep="")

data <- read.table(fileName, header=FALSE)
subjData.all <- data.frame(subjN = factor(data$V1))

outFile <-paste(filePath,subjType,'_',task, '_subj.df', sep="")
save(subjData.all, file=outFile)

}
