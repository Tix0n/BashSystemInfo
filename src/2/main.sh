#!/bin/bash

. ../system_info_functions

. ../set_color_scheme


name_array=("HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC" "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE" "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE")
output_array=("$(hostname_)" "$(timezone_)" "$(user_)" "$(os_)" "$(date_)" "$(uptime_)" "$(uptime_sec_)" "$(ip_)" "$(mask_)" "$(gateway_)" "$(ram_total_)" "$(ram_used_)" "$(ram_free_)" "$(space_root_)" "$(space_root_used_)" "$(space_root_free_)")

clear="\e[0m"

if [[ $# -eq 4 ]]; then
	if [[ "$1" -gt 0 ]] && [[ "$1" -lt 7 ]] && [[ "$2" -gt 0 ]] && [[ "$2" -lt 7 ]] && [[ "$3" -gt 0 ]] && [[ "$3" -lt 7 ]] && [[ "$4" -gt 0 ]] && [[ "$4" -lt 7 ]]; then
		if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
			echo "The font and background colors of the same column match"
		else
			
			for i in ${!name_array[@]}; do
				set_color_font $2
				set_color_background $1
				clear_color

				echo -en "${result}${result_2}${name_array[$i]}${clear} = "
				
				set_color_font $4
				set_color_background $3
				clear_color

				echo -e "${result}${result_2}${output_array[$i]}${clear}"
			done
		fi
	else
		echo "Invalid parametrs"
	fi

else
	echo "Not all parametrs or too many"
fi
