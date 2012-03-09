behav_stats_span <-function(subjType){

###This function outputs behavioral stats for the AntiSaccade Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/span/R/"
fileName <- paste(filePath,subjType,'_WM-SpanLog_', '.df', sep="")
load(fileName)

outFile <- paste(filePath,subjType,'_WM-SpanLog_stats.txt',sep="")
sink(outFile)

###################################################
#################DESCRIPTIVE STATS#################

spanData.score<-spanData.all[spanData.all$spType == "Score", ]
print(paste("Span_MeanScore:", round(mean(spanData.score$numCor),5), sep=" "))


#######################################################


sink()
}
