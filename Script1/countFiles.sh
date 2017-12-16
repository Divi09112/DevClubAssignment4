#!/bin/bash

ls -al "$1" | grep -o ^\-.*$2$ | wc -l
