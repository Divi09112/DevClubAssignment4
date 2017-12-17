#!/bin/bash

#DOESN'T CHECK IF THE FILE IS IN THE REQUIRED FORMAT

result=0
old=$IFS
IFS="
"

for line in $(cat "$1");do
	result=$(($result $(echo $line | cut -d" " -f2) $(echo $line | cut -d" " -f1)))
done
echo $result

IFS=$old
