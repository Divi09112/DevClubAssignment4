#!/bin/bash

#FINAL CODE WITH PROPER ERROR HANDLING

if [ "$1" = '' ] || [ ! -d "$1" ];then
	echo "Invalid Directory"
	exit 1
else
	if [ "$2" = "" ];then
		ls -al "$1" | grep -oc "^\-.*$"
	elif [[ "$2" =~ ^\.[a-z]+$ ]];then
		ls -al "$1" | grep -oc "^\-.*$2$"
	else
		echo "Invalid extension"
		exit 1
	fi
fi
