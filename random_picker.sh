#!/bin/bash
raw_names=$(<"$1")
IFS=$'\n' read -rd '' -a eligible_names <<<"$raw_names"
Black='\033[1;90m'      # Black
Red='\033[1;91m'        # Red
Green='\033[1;92m'      # Green
Yellow='\033[1;93m'     # Yellow
Blue='\033[1;94m'       # Blue
Purple='\033[1;95m'     # Purple
Cyan='\033[1;96m'       # Cyan
White='\033[1;97m'      # White
Flash='\033[5m'
sleep_times=(0.4 0.4 0.2 0.2 0.2 0.1 0.1 0.1 0.1 0.1)
number_of_names=${#eligible_names[@]}

colours=($Black $Red $Green $Yellow $Blue $Purple $Cyan $White)

clear

for delay in ${sleep_times[@]}; do
    for i in $(seq $number_of_names); do
        clear
        printf "${colours[$i-1]}${eligible_names[$i-1]}"
        sleep $delay
    done
done
clear
winner=${eligible_names[ $RANDOM % ${#eligible_names[@]} ]}

for colour in ${colours[@]}; do
    printf "${colour}${winner}"
done
echo ""
figlet $winner
echo ""
for colour in ${colours[@]}; do
    printf "${colour}${winner}"
done
echo ""
echo ""
