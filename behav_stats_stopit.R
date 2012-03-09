behav_stats_stopit <-function(subjType){

###This function outputs behavioral stats for the Stop-It Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/R/"
fileName <- paste(filePath,subjType,'_StopIt.df',sep="")
load(fileName)

outFile <- paste(filePath,subjType,'_StopIt_acc_stats.txt',sep="")
sink(outFile)

###################################################
#################DESCRIPTIVE STATS#################
##Compute the overall mean accuracies  

print(paste("StopIt_MeanAccuracy:", round(mean(stopitData.all$acc),5), sep=" "))
print(paste("StopIt_MeanSSRT:", round(mean(stopitData.all$ssrt),5), sep=" "))

##compute overall SD
print(paste("Stopit_Accuracy_SD:",round(sd(stopitData.all$acc),3), sep=" "))
print(paste("Stopit_SSRT_SD:",round(sd(stopitData.all$ssrt),3), sep=" "))

#######################################################

sink()

}
