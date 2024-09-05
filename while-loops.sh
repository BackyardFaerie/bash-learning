#!/bin/bash

int=11

echo "Counting down: "

while (( $int <= 11 )) | (( $int > 0 )) 
do
	(($int - 1))
	echo "T minus $int"
 	sleep 1
done

echo "Lift off!"
echo "(Pretend the terminal made rocket engine noises)"
