#!/bin/bash

#final code without error handling


declare -r org="$PWD"

backup () {

for file in $(ls "$1");do

	if [ ! -e "$2"/$file ];then
		
		if [ -d "$2"/$file ];then
			mkdir "$2"/$file 
			backup "$1"/$file "$2"/$file "$3"/$file
			
		else
			cp -r "$1"/$file "$2"
			echo "$3"/"$file"
		fi

	elif [ -d "$1"/$file ] && [ -e "$2"/$file ];then
		backup "$1"/$file "$2"/$file "$3"/$file
	else
		:
	fi
done




}


if [ ! "$#" -eq 2 ]; then

	echo "Insufficient arguements"
	exit 1

elif [ ! -d "$1" ] || [ ! -d "$2" ]; then

	echo "Not a valid directory"
	exit 1

else
	cd "$1"
	dir1="$PWD"
	cd "$org"
	cd "$2"
	dir2="$PWD"
	cd "$org"	

	#takes care if onne is parent dir of other(using regex)
	if [[ "$dir1" =~ ^"$dir2".* ]] || [[ "$dir2" =~ ^"$dir1".* ]]; then

		echo "Cannot apply operation if one is the parent directory of other"
		exit 1

	else
		echo "Files copied from "$1" to "$2" are:"
		backup "$1" "$2"
		echo "Files copied from "$2" to "$1" are:"
		backup "$2" "$1"
	fi
fi
