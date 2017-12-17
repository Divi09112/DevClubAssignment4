#!/bin/bash

#flow control for root directories only

for file in $(ls "$1");do
	if [ ! -e "$2"/$file ] ;then
		cp -r "$1"/$file "$2"
	fi
done

for file in $(ls "$2");do
	if [ ! -e "$1"/$file ] ;then
		cp -r "$2"/$file "$1"
	fi
done
