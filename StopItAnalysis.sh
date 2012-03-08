#!/bin/csh -f 

#usage: StopItAnalysis.sh subjType

#usage: subjType: SC AC or YA

echo 'Clearing existing results from SemPrMM/assessment/results/anti-saccade/ folder'
cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/stop-it/
rm StopItResults_$1

	if ($1 == SC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-SC* ) 
		 python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/StopItResults_SC
	   end
	endif
	
	if ($1 == YA) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it	   
	   foreach f ( stop-YA* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/StopItResults_YA
	   end
	endif 
	
	if ($1 == AC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-AC* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/StopItResults_AC
	   end
	endif


echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
