#!/bin/csh -f
#usage: AntiSaccadeAnalysis.sh subjType resultType

# subjType: sc or ac or ya
# resultType: 1 - Short Form
#           : 2 - Long Form


echo 'Converting text files to the Unix format and saving in the SubjGroup_mod folder'
if ($1 == sc) then
   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_orig
   foreach f ( sc* )
        tr '\r' '\n' < $f > ../SC_mod/$f 
   end
endif 
if ($1 == ac) then
   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_orig
   foreach f ( ac* )
        tr '\r' '\n' < $f > ../AC_mod/$f 
   end
endif 

echo 'Clearing existing results from SemPrMM/assessment/results/anti-saccade/ folder'
if ($2 == 1) then 
       cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/
       rm $1_AntiSacc_short
else 
       cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/
       rm $1_AntiSacc_long 
endif
       
#Short Form of Output
if ($2 == 1) then

	if ($1 == sc) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_mod
	   foreach f ( sc* ) 
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/$1_AntiSacc_short $2
	   end
	endif
	
	if ($1 == ya) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/YA_mod
	   foreach f ( ya* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/$1_AntiSacc_short $2
	   end
	endif 
	
	if ($1 == ac) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_mod
	   foreach f ( ac* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/$1_AntiSacc_short $2
	   end
	endif
    echo 'Completed. See results in SemPrMM/assessment/results/anti-saccade/ folder'
endif

#Long Form of Output
if ($2 == 2) then 

	if ($1 == sc) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_mod
	   foreach f ( sc* ) 
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/$1_AntiSacc_long $2
	   end
	endif
	
	if ($1 == ya) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/YA_mod
	   foreach f ( ya* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/$1_AntiSacc_long $2
	   end
	endif 
	
	if ($1 == ac) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_mod
	   foreach f ( ac* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/$1_AntiSacc_long $2
	   end
	endif
	echo 'Completed. See results in SemPrMM/assessment/results/anti-saccade/R folder'
endif

