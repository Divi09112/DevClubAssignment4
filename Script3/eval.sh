#!/bin/bash

#DOESN'T CHECK IF THE FILE IS IN THE REQUIRED FORMAT

result=0

line=0

while read tmp opr; do
	
	line=$(($line+1))	

	if [[ "$opr" =~ ^[/\*\+\-]$ ]]; then
		#using regex to verify operators

		result=$(($result $opr $tmp))

	else
		echo "Invalid operation on line $line"
		exit 1
	fi

done < "$1"

echo $result
