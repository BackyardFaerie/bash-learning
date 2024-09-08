#!/bin/bash

release=/etc/os-release
log=~/update-log
errlog=~/update-error-log
chosen=0

err_check() {
if [ $? -ne 0 ]
then
	echo "Encountered error, see $errlog"
fi
}

apt_nolog() {
	sudo apt update
	sudo apt upgrade -y
	err_check
}


flat_nolog() {
	flatpak upgrade -y
	err_check
}

if grep -q "Debian" $release || grep -q "Ubuntu" $release
then
	while [ "$chosen" -ne 1 ]
	do
		echo "Update what?"
		echo "[1] All (no logs) [2] Apt (no logs) [3] Flatpak (no logs)"
		echo "[4] All           [5] Apt           [6] Flatpak"
		echo "[q]uit"

	read -r option;
		case $option in
		1) echo "Updating everything without logs"
			apt_nolog
			flat_nolog
			echo "Updated everything without logs"
			chosen=1;;
		2) echo "Updating apt packages without logs"
			apt_nolog
			echo "Updated apt packages without logs"
			chosen=1;;
		3) echo "Updating Flatpaks without logs"
			flat_nolog
			echo "Updated Flatpaks without logs"
			chosen=1;;
		4) echo "Updating everything with logs"
			 date | tee $log >> $errlog && apt_nolog >>$log 2>>$errlog
			 date | tee $log >> $errlog && flat_nolog >>$log 2>>$errlog
			echo "Updated everything, see $log and $errlog"
			chosen=1;;
		5) echo "Updating apt with logs"
			date | tee $log >> $errlog && apt_nolog >>$log 2>>$errlog
			echo "Updated apt, see $log and $errlog"
			chosen=1;;
		6) echo "Updating Flatpaks with logs"
			date | tee $log >> $errlog && flat_nolog >>$log 2>>$errlog
			echo "Updated Flatpaks, see $log and $errlog"
			chosen=1;;
		q) echo "Exiting without updating"
			err_check
			chosen=1;;
		*) echo "Invalid choice, exiting without updating"
		chosen=1
		err_check
	esac
done
fi

if grep -q "Arch" $release
then
	/usr/bin/printf "Updating system"
	sudo pacman -Syu
fi
