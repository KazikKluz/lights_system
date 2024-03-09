#!/bin/bash

BRed='\033[1;31m'
BGreen='\033[1;32m'
NC='\033[0m'
Yellow='\033[0;33m'
White='\033[0;37m'
Blue='\033[0;34m'
BCyan='\033[1;36m'


if [ $1 = "ACTIVE" ]; then
    action1="${BGreen}$1  ${NC}"
else 
    action1="${BRed}$1${NC}"
fi

if [ $2 = "ON" ]; then
    state1="${BGreen}$2${NC}"
else 
    state1="${BRed}$2${NC}"
fi

if [ $3 = "ACTIVE" ]; then
    action2="${BGreen}$3  ${NC}"
else 
    action2="${BRed}$3${NC}"
fi

if [ $4 = "ON" ]; then
    state2="${BGreen}$4${NC}"
else 
    state2="${BRed}$4${NC}"
fi




printf "     ${Yellow}Smart Lights Dashboard${NC}" > display
printf "\n${Blue}-------------------------------${NC}" >> display
printf "\n            ${White}Sensor      Light${NC}" >> display
printf "\n${Blue}-------------------------------${NC}" >> display
printf "\n  ${BCyan}House 1:${NC}  $action1     $state1" >> display
printf "\n  ${BCyan}House 2:${NC}  $action2     $state2" >> display
printf "\n${Blue}-------------------------------${NC}" >> display
