#!/bin/bash

. ../system_info_functions

. ../set_color_scheme

. ./input_analysis
. ./color_scheme

name_array=("HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC" "IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE" "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE")
output_array=("$(hostname_)" "$(timezone_)" "$(user_)" "$(os_)" "$(date_)" "$(uptime_)" "$(uptime_sec_)" "$(ip_)" "$(mask_)" "$(gateway_)" "$(ram_total_)" "$(ram_used_)" "$(ram_free_)" "$(space_root_)" "$(space_root_used_)" "$(space_root_free_)")
colors_array=( "(white)" "(red)" "(green)" "(blue)" "(purple)" "(black)" )
clear="\e[0m"


input_analysis


if [[ $# -eq 0 ]]; then
	if [[ "$color_1" -gt 0 ]] && [[ "$color_1" -lt 7 ]] && [[ "$color_2" -gt 0 ]] && [[ "$color_2" -lt 7 ]] && [[ "$color_3" -gt 0 ]] && [[ "$color_3" -lt 7 ]] && [[ "$color_4" -gt 0 ]] && [[ "$color_4" -lt 7 ]]; then
		if [[ $color_1 -eq $color_2 ]] || [[ $color_3 -eq $color_4 ]]; then
			echo "The font and background colors of the same column match"
		else
			
			for i in ${!name_array[@]}; do
				set_color_font $color_2
				set_color_background $color_1
				clear_color

				echo -en "${result}${result_2}${name_array[$i]}${clear} = "
				
				set_color_font $color_4
				set_color_background $color_3
				clear_color

				echo -e "${result}${result_2}${output_array[$i]}${clear}"

			done

			color_scheme
			
		fi
	else
		echo "Invalid parametrs"
	fi
else
	echo "Not all parametrs or too many"
fi
