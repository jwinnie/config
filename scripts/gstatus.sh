#!/bin/bash
dir="$HOME/Github"
# find ~/Github -maxdepth 1 -mindepth 1 -type d -exec /bin/bash -c '(echo {} && cd {} && git status -s -b)' \;
for item in $(ls $dir); do
	echo $item
	cd $dir/$item > /dev/null
	git status -s
	cd - > /dev/null
done
