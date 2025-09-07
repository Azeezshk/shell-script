#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"



USERID=$(id -u)

if [ $USERID -ne 0 ];
then
    echo -e "$B You must have root access to run the script..... ): $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2...........$R Failure $N"
        exit 1
    else
        echo -e "$2...........$G Success $N"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ];
then
    dnf install mysql -y
    VALIDATE $? " $G Installing MySQL $N"
else
    echo -e "$Y MySQL is already Installed...! $N"
fi


dnf list installed git

if [ $? -ne 0 ];
then
    dnf install git -y
    VALIDATE $? "$Y Installing Git $N"
else
    echo -e "$Y Git is Already Installed....! $N"
fi



# ANSI Color Codes:
# \e[31m = Red (errors/fail)
# \e[32m = Green (success)
# \e[33m = Yellow (warnings/info)
# \e[0m  = Reset (back to normal text)

# Root user check:
# id -u → prints current user's UID
# UID 0 = root user
# If not root, script exits with error

# VALIDATE function:
# Purpose: Reuse success/failure checks for commands
# $1 = exit status of previous command ($?)
# $2 = description of the action (e.g., "Installing MySQL")
# Prints colored Success/Failure message and exits on failure