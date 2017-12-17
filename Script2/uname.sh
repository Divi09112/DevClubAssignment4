#!/bin/bash


#to check if file is of required format
file_format () {
	lines=$(cat "$1" | wc -l)
	temp_lines=$(cat "$1" | grep -c ".*:x:.*:.*:.*:.*:.*")
	if [ "$lines" != "$temp_lines" ];
	then
		echo false
	else 
		echo true
	fi
}


if [ "$1" = '' ] || [ ! -f "$1" ];
then
	echo "Invalid File"
	exit 1
elif [ "$2" = '' ];
then
	echo "Invalid user"
	exit 1
else
	if $(file_format "$1") ;
	then
		line=$(cat "$1" | grep "^$2:")
		if [ "$line" = '' ];
		then
			echo "User not present"
		else
			echo "$line" | cut -d":" -f5
		fi
	else
		echo "File is not of the required format"
		exit 1
	fi
fi


