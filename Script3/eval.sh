#!/bin/bash

#DOESN'T CHECK IF THE FILE IS IN THE REQUIRED FORMAT

result=0
old=$IFS
IFS="
"

for line in $(cat "$1");do
	
	num=$(echo $line | cut -d" " -f1)
	op=$(echo $line | cut -d" " -f2)
	
	result=$(($result $op $num))
done

echo $result

IFS=$old
