#!/bin/bash

#repetitive code replaced by function


backup () {
for file in $(ls "$1");do
	if [ ! -e "$2"/$file ];then
		cp -r "$1"/$file "$2"
	fi
done

}

backup "$1" "$2"
backup "$2" "$1"
