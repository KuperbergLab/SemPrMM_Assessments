behav_stats_span <-function(subjType, listPrefix){

###This function outputs behavioral stats for the AntiSaccade Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/span/R/"
fileName <- paste(filePath,listPrefix,'_WM-SpanLog', '.df', sep="")
load(fileName)

outFile <- paste(filePath,listPrefix,'_WM-SpanLog_stats.txt',sep="")
sink(outFile)

###################################################
#################DESCRIPTIVE STATS#################

spanData.score<-spanData.all[spanData.all$spType == "Score", ]
print(paste("SpanScore_Mean:", round(mean(spanData.score$numCor),5), sep=" "))

##compute overall SD
print(paste("SpanScore_SD:",round(sd(spanData.score$numCor),3), sep=" "))


#######################################################


sink()
}
