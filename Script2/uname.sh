#!/bin/bash

count=0

line=$(cat "$1" | grep "$2" | tr ":" " ")

for i in $line; do
	count=$(($count+1))
	if [ $count = 5 ];
	then
		echo $i
	fi
done
