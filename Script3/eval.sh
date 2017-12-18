#!/bin/bash

#DOESN'T CHECK IF THE FILE IS IN THE REQUIRED FORMAT

result=0
line=0


tfile="$(file "$1" | cut -d":" -f2)"


if [ "$1" = "" ]; then
	echo "Not enough arguements"
	exit 1

#to check if file is of correct format

elif [ "$tfile" != " ASCII text" ]; then
	echo "Invalid file format"
	exit 1

else
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
fi

echo $result
