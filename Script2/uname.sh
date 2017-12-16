#!/bin/bash

#FAILS IF USERNAME HAS SPACES

count=0

line=$(cat "$1" | grep "$2" | tr ":" " ")

len=$(echo $line | wc -w)

if [ $len -lt 7 ]; 
then
	echo "Invalid Username"
else
	for i in $line; do
		count=$(($count+1))
		if [ $count = 5 ];
		then
			echo $i
		fi
	done
fi
