#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];
then
    echo "You must have root access to run the script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ] ;
    then
        echo "$2......Failure."
        exit 1
    else
        echo "$2......Success."
    fi
}

dnf list installed mysql

if [ $? -ne 0 ];
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "MySQL is Already Installed......!"
fi

dnf list installed git

if [ $? -ne 0 ];
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is Already installed...!"
fi

# VALIDATE function:
# Purpose: Reuse success/failure checks for commands
# $1 = exit status of previous command ($?)
# $2 = description of the action (e.g., "Installing MySQL")
# Prints colored Success/Failure message and exits on failure

