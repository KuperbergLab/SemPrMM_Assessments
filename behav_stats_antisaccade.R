behav_stats_antisaccade <-function(subjType,listPrefix){

###This function outputs behavioral stats for the AntiSaccade Experiment 

filePath <- "/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/"
fileName <- paste(filePath,listPrefix,'_AntiSaccade_accuracy.df',sep="")
load(fileName)

outFile <- paste(filePath,listPrefix,'_AntiSaccade_acc_stats.txt',sep="")
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

##################################################
##################ANOVAS##########################

antiData.all$condn<-factor(antiData.all$cond,exclude=NULL);
levels(antiData.all$condn)<-c("pro", "anti"); 

antiData.all.aov = aov(acc ~ condn + Error(subj/(condn)),data=antiData.all)
numSubj <-nlevels(factor(antiData.all$subj, exclude= NA))
print(paste("Table of Mean Accuracies, n:", numSubj,sep=" "))
print(model.tables(antiData.all.aov, "means"), digits = 5)

library('ez')
eztest <-ezANOVA(data=antiData.all,dv = .(acc),wid=.(subj),within=.(condn),type=3,detailed=TRUE)
print(eztest)

#######################################################


sink()
}
