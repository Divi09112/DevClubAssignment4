#!/bin/bash

#FAILS IF FILE NAME HAS SPACE SEPARATED WORDS

filename=$( ls )
count=0

for i in $filename; do
	if [ -f $i ]; then 
		count=$(($count+1))
	fi
done

echo $count
