#APcombine.py : Combines the Anti and Pro files and saves them in a single text document

import sys

def readTableC(filename1,filename2,filename3):   
    myFile1 = open(filename1, "r")
    temp = 1
    dataTable1 = []
    while temp:
        temp = myFile1.readline()
        dataTable1.append(temp)
            
    myFile1.close()
    #---------------------
    myFile2 = open(filename2, "r")
    temp = 1  
    while temp:
        temp = myFile2.readline()
        dataTable1.append(temp)
           
    listlength=len(dataTable1)
    myFile2.close()
    #------------------------
    myFile3 = open(filename3, "w")
    myFile3.close()   
    myFile3 = open(filename3, "a")   
    for i in range(0,listlength):
        myFile3.write(str(dataTable1[i]))
    myFile3.close()
    
 
if __name__ == "__main__":
   
   readTableC(sys.argv[1], sys.argv[2], sys.argv[3])
    
