behav_stats_antisaccade <-function(subjType){

###This function outputs behavioral stats for the AntiSaccade Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/"
fileName <- paste(filePath,'AntiSaccade_',subjType,'_accuracy.df',sep="")
load(fileName)

outFile <- paste(filePath,'AntiSaccade_',subjType,'_acc_stats.txt',sep="")
sink(outFile)

###################################################
#################DESCRIPTIVE STATS#################
##include both pro and anti conditions
##Compute the overall mean accuracies  
antiData.all<-antiData.all[antiData.all$cond == "Pro" | antiData.all$cond == "Anti", ]
print(paste("ProAnti_MeanAccuracy:", round(mean(antiData.all$acc),5), sep=" "))

##Compute the mean accuracies across pro and anti conditions 
antiData.pro<-antiData.all[antiData.all$cond =="Pro", ]
print(paste("Pro_MeanAccuracy:", round(mean(antiData.pro$acc),5), sep=" "))

antiData.anti<-antiData.all[antiData.all$cond == "Anti", ]
print(paste("Anti_MeanAccuracy:", round(mean(antiData.anti$acc),5), sep=" "))

##compute overall SD
print(paste("ProAnti_SD:",round(sd(antiData.all$acc),3), sep=" "))

#######################################################


sink()
}
