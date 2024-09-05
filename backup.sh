#!/bin/bash

# Incorrect number of arguments provided
if [ $# -ne 2 ]
then
	/usr/bin/printf "Must provide 2 arguments, you provided $#\nUsage is ./backup -source-dir -target-dir\n"
	exit 1
fi

# Check for rsync
if ! command -v rsync > /dev/null 2>&1
then
	/usr/bin/printf "rsync not installed, install now?\n[1] Yes [2] No\n"
read -r rsynci
case $rsynci in
	1) sudo apt install -y rsync;; # sudo apt install -y rsync;;
	2) exit 0
esac
fi

# Get date
date=$(date "+%Y-%m-%d")

rsync_options="-avb --backup-dir $2/$date --delete"

$(which rsync) $rsync_options "$1" "$2/current" > "backup_$date.log"
