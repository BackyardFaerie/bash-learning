#!/bin/bash

program=htop

if command -v $program
then
	echo "$program installed"
else
	echo "$program not installed"
	sudo apt update && sudo apt install -y htop 
fi

$program
