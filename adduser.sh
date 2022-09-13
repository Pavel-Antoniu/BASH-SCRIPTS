#!/bin/bash

#This script creates a user and then set's it's password.
#After the password is set it will expire after the first login.

USER_ID=$(id -u)

if [[ ${USER_ID} != 0 ]]
then
	echo 'Run the script with sudo or root privileges'
	exit 1
fi

read -p 'User name: ' USER_NAME

read -p 'Name of who will use this account: ' COMMENT

read -p 'Introduce the password, which will expire after the first login: ' PASSWORD


useradd -c "${COMMENT}" -m ${USER_NAME}

echo ${PASSWORD} | passwd ${USER_NAME}

passwd -e ${USER_NAME}


