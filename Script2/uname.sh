#!/bin/bash

#DOESN'T CHECK IF FILE IS OF THE REQUIRED FORMAT AND FAILS IF INITIAL PART OF THE USER IS GIVEN

if [ $1 = '' ] || [ ! -f "$1" ];
then
	echo "Invalid File"
	exit 1
elif [ "$2" = '' ];
then
	echo "Invalid user"
	exit 1
else
	line=$(cat "$1" | grep "^$2")
	if [ "$line" = '' ];
	then
		echo "User not present"
	else
		echo "$line" | cut -d":" -f5
	fi
fi


