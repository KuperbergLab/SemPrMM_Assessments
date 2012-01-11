#!/bin/csh -f 

cd /autofs/cluster/kuperberg/SemPrMM/assessment/anti-saccade/AC_orig

foreach f (*)
     tr '\r' '\n' < $f > ../AC_mod/$f 
end
