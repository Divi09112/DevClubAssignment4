#!/bin/bash

#final code without error handling


backup () {
for file in $(ls "$1");do
	if [ ! -e "$2"/$file ];then
		cp -r "$1"/$file "$2"
	elif [ -d "$1"/$file ] && [ -e "$2"/$file ];then
		backup "$1"/$file "$2"/$file
	fi
done

}

backup "$1" "$2"
backup "$2" "$1"
