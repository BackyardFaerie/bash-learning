#!/bin/bash

line="$(/usr/bin/ls -lah $1 | /usr/bin/wc -l)"

if [ $# -ne 1 ]
then
	/usr/bin/echo "Missing argument"
	exit 1 
fi

/usr/bin/echo "Line count of $1 is $((line-1))"
