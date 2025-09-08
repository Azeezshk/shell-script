#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"


LOGS_FOLDER="/var/log/shellscript-log"
LOG_FILE="echo $0 | cut -d "." -f1"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=($LOGS_FOLDER/$LOG_FILE-$TIMESTAMP)

#VALIDATE FUNCTION FOR RESUABLE CODE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.........Failure"
        exit 1
    else
        echo "$2.........Success"
    fi
}

echo "The script is exexuted at : $TIMESTAMP" &>> $LOG_FILE_NAME

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You must have sudo access to run the script"
    exit 1
fi

#creating directory for LOG_FOLDER

mkdir -p "$LOGS_FOLDER"
chmod 755 "$LOGS_FOLDER)"


#creating loop for installing package

for package in $@
do
    dnf list installed $package -y &>> $LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
    dnf install $package -y         %>> $LOG_FILE_NAME
    VALIDATE $? "Installing $package"
else
    echo "$package is Already Installed....!"
fi

        






