behav_save_df_span <- function(subjType, listPrefix){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/span/R/"
fileName <- paste(filePath,listPrefix,'_WM-Span_Long.txt',sep="")

data <- read.table(skip=1, fileName, header=FALSE)
spanData.all <- data.frame(subj = factor(data$V1), spType=data$V2, numCor=data$V3)

outFile <-paste(filePath,listPrefix,'_WM-SpanLog', '.df', sep="")
save(spanData.all, file=outFile)

}
