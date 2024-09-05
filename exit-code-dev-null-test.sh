#!/bin/bash

package=htop

sudo apt install $package >> /dev/null

if [ $? -eq 0 ]
then
	echo "Success, bin dir is: "
	which $package
else
	echo "Failure, non-zero exit code"
fi
