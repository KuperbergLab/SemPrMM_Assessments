behav_stats_stopit <-function(subjType){

###This function outputs behavioral stats for the Stop-It Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/R/"
fileName <- paste(filePath,'StopIt_',subjType,'_accuracy.df',sep="")
load(fileName)

outFile <- paste(filePath,'StopIt_',subjType,'_acc_stats.txt',sep="")
sink(outFile)

###################################################
#################DESCRIPTIVE STATS#################
##Compute the overall mean accuracies  

print(paste("StopIt_MeanCorResp_Percent:", round(mean(stopitData.all$cresp),5), sep=" "))
print(paste("StopIt_MeanSSRT:", round(mean(stopitData.all$ssrt),5), sep=" "))

##compute overall SD
print(paste("Stopit_CorResp_SD:",round(sd(stopitData.all$cresp),3), sep=" "))
print(paste("Stopit_SSRT_SD:",round(sd(stopitData.all$ssrt),3), sep=" "))

#######################################################


sink()
}
