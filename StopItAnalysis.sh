#!/bin/csh -f 

#usage: StopItAnalysis.sh subjType

#usage: subjType: sc or ac or ya (lower case)

echo 'Clearing existing results from SemPrMM/assessment/results/stopit/ folder'
cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/stop-it/
rm $1_StopItResults

	if ($1 == sc) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-sc* ) 
		 python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/sc_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif
	
	if ($1 == ya) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it	   
	   foreach f ( stop-ya* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/ya_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif 
	
	if ($1 == ac) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/stop-it
	   foreach f ( stop-ac* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/stopit.py $f /cluster/kuperberg/SemPrMM/assessment/results/stop-it/ac_StopItResults
	   end
	   echo 'Completed. See result in SemPrMM/assessment/results/stop-it folder'
	endif



