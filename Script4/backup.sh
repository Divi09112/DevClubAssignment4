#!/bin/bash

#final code with error handling

declare -r org="$PWD"

backup () {

for file in $(ls "$1");do

	if [ ! -e "$2"/"$file" ];then
		
		if [ -d "$1"/"$file" ];then
 
			#doesnt exist and is a dir
			mkdir "$2"/"$file"

			if [ "$3" = "" ];then

				backup "$1"/"$file" "$2"/"$file" "$file"
				#3rd argument is for printing the relative path of files in sub-dirs

			else
				backup "$1"/"$file" "$2"/"$file" "$3"/"$file"
			fi			

		else 
			#doesnt exist and is a file

			cp -r "$1"/"$file" "$2"

			if [ "$3" = "" ];then
				echo "$file"      # print file to stdout
			else
				echo "$3"/"$file"  #print file to stdout
			fi			

		fi

	elif [ -d "$1"/"$file" ] && [ -e "$2"/"$file" ];then
		
		#exists and is a dir
		
		if [ "$3" = "" ];then

			backup "$1"/"$file" "$2"/"$file" "$file"

		else
			backup "$1"/"$file" "$2"/"$file" "$3"/"$file"
		
		fi
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
	dir1="$PWD" #to get absolute paths

	cd "$org"

	cd "$2"
	dir2="$PWD"

	cd "$org" #to set PWD to original directory	


	
	if [[ "$dir1" =~ ^"$dir2".* ]] || [[ "$dir2" =~ ^"$dir1".* ]]; then

		#takes care if onne is parent dir of other(using regex)

		echo "Cannot apply operation if one is the parent directory of other"
		exit 1

	else
		echo "Files copied from "$1" to "$2" are:"
		backup "$dir1" "$dir2"
		echo
		echo "Files copied from "$2" to "$1" are:"
		backup "$dir2" "$dir1"
	fi
fi
