#!/bin/bash

#COULD FAIL IF EXTENSION CONTAINS REGEX EXPRESSIONS BECAUSE $2 IS EXPANDED BEFORE REGEX

if [ "$1" = '' ] || [ ! -d "$1" ];
then
	echo "Invalid Directory"
	exit 1
else
	ls -al "$1" | grep -oc "^\-.*$2$"
fi
