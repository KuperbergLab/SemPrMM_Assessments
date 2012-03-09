behav_save_df_span <- function(subjType){

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/span/R/"
fileName <- paste(filePath,subjType,'_WM-Span_Long',sep="")

data <- read.table(skip=1, fileName, header=FALSE)
spanData.all <- data.frame(subj = factor(data$V1), spType=data$V2, numCor=data$V3)

outFile <-paste(filePath,subjType,'_WM-SpanLog_', '.df', sep="")
save(spanData.all, file=outFile)

}
