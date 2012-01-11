##stopit.py Stop Signal Analysis
## 

##It is run recursively for all the subjects in the stop-it folder
##by being called by the shell script SemPrMM/assessment/scripts/StopItAnalysis.sh
 

import sys
import os
def readTable(inFile, outFile):
    
   myFile1 = open(inFile, "r") #Read the stopit data file
   temp = 1 
   dataTable1=[]
   dataTable2=[]
   dataTable3=[]
   while temp:
        temp = myFile1.readline()
        temp1 = temp.strip() # when I included (' ') it did not return the items as a list, but when I just wrote () it did the trick!
        if temp1:
            temp2 = temp1.split()
            dataTable1.append(temp2) # Save information as a list of items in a DataTable
   listlength=len(dataTable1)   
   myFile1.close()
   
   rt_sum=ssd_sum=count=count_rt=rt_mean=ssd_mean=ssrt=signal_count=cor_resp=0
   for i in range(2,len(dataTable1)):
        count=count+1
        lineTemp = dataTable1[i]
        ssd=float(lineTemp[8])
        signal=int(lineTemp[3])
        stim=int(lineTemp[2])
        rt=float(lineTemp[6])
        resp=int(lineTemp[5])
        correct=int(lineTemp[4])
        if (signal==0) and (rt!=0):
            ##if (rt!=0):
            rt_sum = rt_sum + rt
            count_rt = count_rt + 1
        elif (signal==1):
            ssd_sum = ssd_sum + ssd
            signal_count = signal_count + 1
            if (resp!=0):
                cor_resp=cor_resp + 1
   rt_mean=(float(rt_sum)/count_rt)
   ssd_mean=(float(ssd_sum)/signal_count)
   ssrt=(rt_mean-ssd_mean)
   Pcor_resp=(float(cor_resp)/signal_count)*100
   print(rt_mean)
##   print(ssd_mean)
##   print(ssrt)
##   print(Pcor_resp)

   myFile2 = open(outFile, "a") 
   subjID=str.split(str(inFile), '.txt')   ## To get the subject ID from the Input File
   subjID=str.split(str(subjID[0]), 'stop-')
   subjID=str(subjID[1])
   
   if inFile =='Jane':  ## Change this to be the first file in your folder.
        myFile2.write(str('SubID') + " ")
        myFile2.write(str('SSRT')+ " " )
        myFile2.write("\n")
        myFile2.write(str(ssrt))
        myFile2.write("\n")
        myFile2.close()
   else:
        myFile2.write(str(subjID))
        myFile2.write("\t")
        myFile2.write(str(Pcor_resp))
        myFile2.write("\t")
        myFile2.write(str(ssrt))
        myFile2.write("\n")
        myFile2.close()        


if __name__ == "__main__":
   
   readTable(sys.argv[1], sys.argv[2])
