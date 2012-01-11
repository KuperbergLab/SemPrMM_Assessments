#!/bin/csh -f 

#usage: StopItAnalysis.sh subjType

#usage: subjType: SC AC or YA



	if ($1 == SC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-SC* ) 
		 python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f StopItResults_SC
	   end
	endif
	
	if ($1 == YA) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it	   
	   foreach f ( stop-YA* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f StopItResults_YA
	   end
	endif 
	
	if ($1 == AC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-AC* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f StopItResults_AC
	   end
	endif


