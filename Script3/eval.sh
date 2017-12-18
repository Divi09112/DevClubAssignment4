#!/bin/bash

#DOESN'T CHECK IF THE FILE IS IN THE REQUIRED FORMAT

result=0

line=0

while read tmp opr; do
	
	line=$(($line+1))	

	case "$opr" in
		"+")
			result=$(($result+$tmp))
			;;

		"-")
			result=$(($result-$tmp))
			;;

		"/")	
			result=$(($result/$tmp))
			;;
		
		"*")
			result=$(($result*$tmp))
			;;

		*)
			echo "Invalid operation on line $line"
			exit 1
			;;
	esac
done < "$1"

echo $result
