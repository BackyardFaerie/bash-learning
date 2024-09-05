#!/bin/bash

fin=0

while [ $fin -ne 1 ]
do
	echo "Enter number [1] - [5] or [q]uit"

	read int;
	case $int in
		1) echo "one" && fin=1;;
		2) echo "two" && fin=1;;
		3) echo "three" && fin=1;;
		4) echo "four" && fin=1;;
		5) echo "five" && fin=1;;
		q) fin=1;;
		*) echo "six or more" && fin=1
	esac
done

echo "Exiting script"
