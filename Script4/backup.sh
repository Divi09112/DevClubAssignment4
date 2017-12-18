#!/bin/bash

#final code without error handling


declare -r org="$PWD"

backup () {
for file in $(ls "$1");do

	if [ ! -e "$2"/$file ];then
		cp -r "$1"/$file "$2"

	elif [ -d "$1"/$file ] && [ -e "$2"/$file ];then
		backup "$1"/$file "$2"/$file

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
	backup "$1" "$2"
	backup "$2" "$1"
fi
