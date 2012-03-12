#!/bin/csh -f 

#usage: StopItAnalysis.sh subjType listPrefix

#usage: subjType: sc or ac or ya (lower case)

echo 'Clearing existing results from SemPrMM/assessment/results/stopit/ folder'
cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/stop-it/
rm $1_StopItResults
rm $2_StopItResults

	if ($1 == sc) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
           foreach line (`cat /autofs/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/$2.txt`) 
		 python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py stop-$line.txt /cluster/kuperberg/SemPrMM/assessment/results/stop-it/$2_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif
	
	if ($1 == ya) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it	   
           foreach line (`cat /autofs/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/$2.txt`)
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py stop-$line.txt /cluster/kuperberg/SemPrMM/assessment/results/stop-it/$2_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif 
	
	if ($1 == ac) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
           foreach line (`cat /autofs/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/$2.txt`)
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py stop-$line.txt /cluster/kuperberg/SemPrMM/assessment/results/stop-it/$2_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif



