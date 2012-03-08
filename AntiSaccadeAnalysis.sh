#!/bin/csh -f
#usage: AntiSaccadeAnalysis.sh subjType resultType

# subjType: SC AC or YA
# resultType: 1 - Short Form
#           : 2 - Long Form

echo 'Clearing existing results from SemPrMM/assessment/results/anti-saccade/ folder'
cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/
if ($2 == 2) then
       rm longOut$1
else
       rm shortOut$1
endif

echo 'Converting text files to the Unix format and saving in the SubjGroup_mod folder'
if ($1 == SC) then
   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_orig
   foreach f ( SC* )
        tr '\r' '\n' < $f > ../SC_mod/$f 
   end
endif 
if ($1 == AC) then
   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_orig
   foreach f ( AC* )
        tr '\r' '\n' < $f > ../AC_mod/$f 
   end
endif 


#Short Form of Output
if ($2 == 1) then

	if ($1 == SC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_mod
	   foreach f ( SC* ) 
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/shortOutSC $2
	   end
	endif
	
	if ($1 == YA) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/YA_mod
	   foreach f ( YA* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/shortOutYA $2
	   end
	endif 
	
	if ($1 == AC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_mod
	   foreach f ( AC* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/shortOutAC $2
	   end
	endif

endif

#Long Form of Output
if ($2 == 2) then 

	if ($1 == SC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/SC_mod
	   foreach f ( SC* ) 
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/longOutSC $2
	   end
	endif
	
	if ($1 == YA) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/YA_mod
	   foreach f ( YA* )
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/longOutYA $2
	   end
	endif 
	
	if ($1 == AC) then
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_mod
	   foreach f ( AC* )
		  python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $f /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/longOutAC $2
	   end
	endif
endif

