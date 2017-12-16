#!/bin/bash

#FAILS BECAUSE OF THE TOTAL LINE IN ls -l

ls -l $1 | grep -v ^d | wc -l
