#!/bin/bash
#JEFHCO

for i in adminso wblanco 
do
useradd  -m -s /bin/bash -K PASS_MAX_DAYS=30 $i
echo T3mp0r4! | passwd $i --stdin
done

