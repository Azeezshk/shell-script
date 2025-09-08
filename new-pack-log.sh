#!/bin/bash

R="\e[31m"
G="\e[32m"
Y=\e[33m
B="\e[34m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscriipt-logs"
LOG_FILE=$(echo "$0" | cut -d "." f1)
TIMESTAMP=$(date +Y%-m%-d%-H%-M%-S%)
LOG_FILE_NAME=($LOGS_FOLDER/$LOG_FILE+$TIMESTAMP.log)


VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "$2.........Failure"
        exit 1
    else
        echo "$2.........Success"
        fi
}

echo "Script executed at : $TIMESTAMP"

#Root Check

USERID=$(id -u)
if [ $USERID -ne 0 ];
then
    echo "You must have root access to run the script"
    exit 1
fi

#creating directory of log folder in /var/log

mkdir -p "$LOGS_FOLDER"

#SET Permissions

chmod 755 "$LOGS_FOLDER"

#For installing MySQL

dnf list installed mysql

if [ $? -ne 0 ];
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo " MySQL is already Installed....!"
fi

# Nginx installing 

dnf list installed nginx

if [ $? -ne 0 ];
then
    dnf install nginx -y
    VALIDATE $? "Installing Nginx"
else
    echo " Nginx is already Installed..!"
fi
