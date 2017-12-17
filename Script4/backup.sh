#!/bin/bash

#flow control for root directories only

for file in $(ls "$1");do
	echo $file
	if [ -e "$2"/$file ] ;then
		echo "yes"
	else
		echo "no"
	fi
done

for file in $(ls "$2");do
	if [ -e "$1"/$file ] ;then
		echo "yes"
	else
		echo "no"
	fi
done
