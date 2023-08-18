#!/bin/bash

. ../system_info_functions
. ./run_all_functions

if [ $# -eq 0 ]; then

	run_all_functions_ | tee tmp.txt

	echo "Save to file? Enter Y/N"
	read answer

	if [ $answer == "Y" -o $answer == "y" ]; then
		name_file=$(date +"%d_%m_%y_%H_%M_%S".status)
		touch $name_file
		cat tmp.txt > $name_file
	fi

	rm tmp.txt

else 
	echo "Invalid parameter"
fi
