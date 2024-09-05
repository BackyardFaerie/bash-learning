#!/bin/bash

for file in logfiles/*.log
do
	tar -cvzf $file.tar.gz $file
done

echo "Log files compressed"
