#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/"
theme='this'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostnamectl hostname`

# Options
shutdown='󰤆 Shutdown'
reboot='󰑓 Reboot'
lock='󰌾 Lock'
suspend='󰤄 Suspend'
logout='󰈆 Logout'
yes='Yes'
no='No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "archpc" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
# confirm_cmd() {
# 	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
# 		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
# 		-theme-str 'listview {columns: 2; lines: 1;}' \
# 		-theme-str 'element-text {horizontal-align: 0.5;}' \
# 		-theme-str 'textbox {horizontal-align: 0.5;}' \
# 		-dmenu \
# 		-p 'Confirmation' \
# 		-mesg 'Are you Sure?' \
# 		-theme ${dir}/${theme}.rasi
# }
#
# # Ask for confirmation
# confirm_exit() {
# 	echo -e "$yes\n$no" | confirm_cmd
# }

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$logout\n$suspend\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {	
	if [[ $1 == '--shutdown' ]]; then
		loginctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		loginctl reboot
	elif [[ $1 == '--suspend' ]]; then
		mpc -q pause
		amixer set Master mute
		loginctl suspend
	elif [[ $1 == '--logout' ]]; then
		bspc quit
	fi	
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
