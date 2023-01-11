#!/bin/bash

GREEN='\033[1;32m'
RED='\033[1;31m'
NOCOLOR="\033[0m"



if [$(id -u) != 0]
then 
	echo "You must be root to run this script"
	exit 1
fi

echo -e "step1: ${GREEN}Packages to be upgraded${NOCOLOR}"
apt update

echo -e "${RED}Do you want to proceed further with the updates of the packeges?[y/n]${NOCOLOR}"
read ANSWER

if [ ${ANSWER} == 'n' ]
then
	echo "NO"
	exit 1
else
	echo "YES"
	exit 0
fi

