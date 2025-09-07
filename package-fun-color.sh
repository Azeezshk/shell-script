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
    echo "$Y MySQL is already Installed...! $N"
fi


dnf list installed git

if [ $? -ne 0 ];
then
    dnf install git -y
    VALIDATE $? "$Y Installing Git $N"
else
    echo "$Y Git is Already Installed....! $N"
fi
