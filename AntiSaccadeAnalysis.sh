#!/bin/csh -f
#usage: AntiSaccadeAnalysis.sh subjType resultType listPrefix

# subjType: sc or ac or ya
# resultType: short - Short Form
#           : long - Long Form
#listPrefix: ac.n10.meeg.b .... 

echo 'Converting text files to the Unix format and saving in the SubjGroup_mod folder'

cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/$1_orig
if ($1 == ac || $1 == sc) then 
   foreach f ( $1* )
        tr '\r' '\n' < $f > ../$1_mod/$f 
  end
endif


echo 'Clearing existing results from SemPrMM/assessment/results/anti-saccade/ folder'
if ($2 == short) then 
       cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/
       rm $3_AntiSacc_short
else 
       cd /autofs/cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/
       rm $3_AntiSacc_long 
endif
       

#Short Form of Output
if ($2 == short) then
    	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/$1_mod
           echo 'Inside'
           foreach line (`cat /autofs/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/$3.txt`)
                  echo $line
                  python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $line /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/$3_AntiSacc_short $2	   
           end
           echo 'Completed. See results in SemPrMM/assessment/results/anti-saccade/ folder'
endif

#Long Form of Output
if ($2 == long) then 
	   cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/$1_mod
           foreach line (`cat /autofs/cluster/kuperberg/SemPrMM/assessment/scripts/function_input/$3.txt`)
                   echo $line 
		   python /cluster/kuperberg/SemPrMM/assessment/scripts/antiSaccade.py $line /cluster/kuperberg/SemPrMM/assessment/results/anti-saccade/R/$3_AntiSacc_long $2
	   end
	   echo 'Completed. See results in SemPrMM/assessment/results/anti-saccade/R folder'
endif

