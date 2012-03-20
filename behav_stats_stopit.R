behav_stats_stopit <-function(subjType, listPrefix){

###This function outputs behavioral stats for the Stop-It Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/stop-it/R/"
fileName <- paste(filePath,listPrefix,'_StopIt.df',sep="")
load(fileName)

outFile <- paste(filePath,listPrefix,'_StopIt_acc_stats.txt',sep="")
sink(outFile)

stopitData.select = subset(stopitData.all, stopitData.all$acc > 15 & stopitData.all$acc < 50)

###################################################
#################DESCRIPTIVE STATS#################
##Compute the overall mean accuracies  

print(paste("StopIt_MeanAccuracy-WithinRange:", round(mean(stopitData.select$acc),5), sep=" "))
print(paste("StopIt_MeanAccuracy:", round(mean(stopitData.all$acc),5), sep=" "))
print(paste("StopIt_MeanSSRT:", round(mean(stopitData.all$ssrt),5), sep=" "))

##compute overall SD
print(paste("Stopit_Accuracy-WithinRange_SD:",round(sd(stopitData.select$acc),3), sep=" "))
print(paste("StopitAccuracy_SD:",round(sd(stopitData.all$acc),3), sep=" "))
print(paste("Stopit_SSRT_SD:",round(sd(stopitData.all$ssrt),3), sep=" "))


#######################################################

sink()

}
