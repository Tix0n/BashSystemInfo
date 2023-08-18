#!/bin/bash

. ./directory_analysis_functions

last_sym="${1: -1}"

if [ $# -ne 1 ]; 
    then echo "Illegal number of parameters"
elif ! [ -d $1 ] || [ "$last_sym" != "/" ]; then
	echo 'Invalid directory'
else

	START=$(date +%s)

	total_number_of_folders_ $1

	top_5_folders_weight_ $1

	total_number_of_files_ $1

	number_of_conf_files_ $1

	number_of_text_files_ $1

	number_of_executable_files_ $1

	number_of_logs_ $1

	number_of_archives_ $1

	number_of_symbolic_links_ $1

	top_10_files_weight_ $1

	top_10_executable_files_weight_ $1
	
	END=$(date +%s)
	DIFF=$(( $END - $START ))
	echo "It took $DIFF seconds"

fi
