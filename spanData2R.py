import sys
import os 
import os.path
import readInput
from operator import itemgetter, attrgetter

# usage: python mriaccuracy.py BaleenMM or MaskedMM or AXCPT

def spanData2R(subjType, listPrefix):
        data_path = '/cluster/kuperberg/SemPrMM/assessment/'
        inFile1 = data_path + 'scripts/function_input/' + str(listPrefix) + '.txt'  
        inFile2 = data_path + 'span/Input/' + 'WM-SpanLog_' + str(subjType)  
        outFile1 = data_path + 'results/span/R/' + str(listPrefix) + '_WM-Span_Long.txt'  

        
##     if (subjType == 'ac'):
##         subject_filename = data_path + 'scripts/function_inputs/ac.meg.all.txt'
##     if (subjType == 'sc'):
##         subject_filename = data_path + 'scripts/function_inputs/sc.meg.all.txt'
##     if (subjType == 'ya'):
##         subject_filename = data_path + 'scripts/function_inputs/ya.meg.all.txt'
        subject_list = readInput.readList(inFile1)
        ##print subject_list
##
        for subject in subject_list:
            print subject
  
#To Find the total number of rejected trials, and percentage inclusion
        #subjID = str(subjType)+ str(subject)
        totalTrials = 0 # Must be initialised within the loop to refresh for each subject :) 
        dataTable1=[]
        dataTable2=[]
        lineTemp = []
        lineTemp1 = []
        temp = 1
        header = []

         
        if os.path.exists(inFile1):
            print("File exists")
        else:
            print("Check the input file name")
    
        myFile1 = open(inFile2, "r") 
        while temp:
             temp = myFile1.readline()
             temp1 = temp.strip() # not ('')
             if temp1:
                  temp2 = temp1.split()
                  dataTable1.append(temp2) # Save information as a list of items in a DataTable
                  runCount=len(dataTable1)   
        myFile1.close()

        header = dataTable1[0]
        span_len = len(header)
        print(runCount)
        print(span_len)

        myFile2 = open(outFile1, "w")
        myFile2.write("Sub:\t\tSpan\t\tNumCorrect\n")	
        for i in range(1, runCount):
               lineTemp = (dataTable1[i])
               ##print(lineTemp)
               #print(lineTemp[0])
               for j in range(1,span_len):
                     if str(lineTemp[0]) in subject_list: 
                                               
                          myFile2.write(lineTemp[0] + '\t\t')
                          myFile2.write(header[j] + '\t\t')
                          myFile2.write(lineTemp[j])
                          myFile2.write('\n')
        print("Completed. See result in /assessment/results/span/R/ folder")

if __name__ == "__main__":
   
   spanData2R(sys.argv[1], sys.argv[2])

     
