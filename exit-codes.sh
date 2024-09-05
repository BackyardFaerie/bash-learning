#!/bin/bash

package=htop
package-2=wrong-package

# sudo apt install $package
sudo apt install $package-2

if [ $? -eq 0 ]
then
	echo "Success! Your bin dir is: "
	which $package
else
	echo "Failed with exit code: "
	echo $?
fi
