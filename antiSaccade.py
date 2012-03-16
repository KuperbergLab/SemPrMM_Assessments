##anti.py Anti Saccade Analysis 
##This program accepts the anti_saccade data file generated for each Subject(anti and pro combined),
##and computes the Percentage correct for "Main" Trials in Pro and Anti separately.
##It also calculates the Mean Reaction Time for "Main" "Correct" trials in Anti and Pro separately.

##It is run recursively for all the subjects in a folder by calling the shell script SemPrMM/assessment/scripts/AntiSaccadeAnalysis.sh
 

import sys
import os

def readTable(inFile,outFile,resultType):
   myFile1 = open(inFile, "r") #Read the antisaccade data file
   print myFile1
   temp = 1 
   dataTable1 = []  
   while temp:
        temp = myFile1.readline()
        temp1 = temp.strip()
        
        if temp1:
            temp2 = temp1.split(',')
            dataTable1.append(temp2) # Save information as a list of items in a DataTable
                      
   listlength = len(dataTable1)
   myFile1.close()
#--------------------------------------------------------------------------
#Calculate the Percentage Correct and Mean Reaction Times for Anti and Pro
   corP=corA=0
   rxTimeP=rxTimeA=0
   Length=LengthP=LengthA=0
   for i in range(0,len(dataTable1)): 
        lineTemp = dataTable1[i]
        ans = lineTemp[7]
        main = lineTemp[1]
        task = lineTemp[3] 
        if main =='main':
            if task =='pro':
               LengthP = LengthP+1
               if (ans == "correct"):
                  corP+=1
                  rxTimeP=rxTimeP + int(lineTemp[8])
            if task=='anti':
               LengthA=LengthA+1
               if (ans == "correct"):
                   corA+=1
                   rxTimeA=rxTimeA + int(lineTemp[8])
 
   corPCent=(corP/float(LengthP))*100
   rxTimeMeanP=(rxTimeP/float(LengthP))                         
   corACent=(corA/float(LengthA))*100
   rxTimeMeanA=(rxTimeA/float(LengthA))       

   temp=1
   dataTable2 =[] 
   
   def longResults(inFile, outFile):
      myFile2 = open(outFile, "a")   
      if inFile=="sc10" or inFile=="ac1" or inFile=="ya1":  ## Change this to be the first file in your folder. Eg:SC10 or AC1 or YA1
        myFile2.write(str('SubID') + " ")
        myFile2.write(str('Condition')+ " " )
        myFile2.write(str('Accuracy')+ " " )
        myFile2.write(str('ReactionTime')+ " " )
        myFile2.write("\n")

      myFile2.write(inFile+ "   ")
      myFile2.write(str('Pro') + "   " + str("%.2f" % round(corPCent,2)) + "   ")
      myFile2.write(str("%.2f" % round(rxTimeMeanP,2)))
      myFile2.write("\n")
      myFile2.write(inFile + "   ")
      myFile2.write(str('Anti') + "   " + str("%.2f" % round(corACent,2))+ "   ")
      myFile2.write(str("%.2f" % round(rxTimeMeanA)))
      myFile2.write("\n")
      myFile2.close()

   def shortResults(inFile, outFile):
      myFile3 = open(outFile, "a") 
      #if os.stat(inFile).st_size == 0: ## Check to see if inFile is empty- to Enter Header on the first Row
      if inFile=="sc4" or inFile=="ac1" or inFile=="ya1":  ## Change this to be the first file in your folder. Eg:SC10 or AC1 or YA1
        myFile3.write(str('SubID') + " ")
        myFile3.write(str('ProAcc%')+ " " )
        myFile3.write(str('AntiAcc%')+ " " )
        myFile3.write(str('ProRxTime')+ " " )
        myFile3.write(str('AntiRxTime'))
        myFile3.write("\n")
   
      myFile3.write(inFile+ "   ")
      myFile3.write(str("%.2f" % round(corPCent,2)) + "   ")
      myFile3.write(str("%.2f" % round(corACent,2))+ "   ")
      myFile3.write(str("%.2f" % round(rxTimeMeanP,2))+ "   ")
      myFile3.write(str("%.2f" % round(rxTimeMeanA)))
      myFile3.write("\n")
      myFile3.close()

   if resultType == 'short':
      shortResults(inFile, outFile)
   elif resultType == 'long':
      longResults(inFile, outFile)
   else:
      print("Enter 1 for Short Form or 2 for Long form of Results")
      print resultType
      print corACent


if __name__ == "__main__":
   
   readTable(sys.argv[1], sys.argv[2], sys.argv[3])
    

