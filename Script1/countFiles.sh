#!/bin/bash

#FAILS IF DIRECTORY NAME HAS SPACE SEPARATED WORDS

ls -l $1 | grep ^- | wc -l
