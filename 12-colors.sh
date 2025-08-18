#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
     if [ $1 -ne 0 ]
    then 
        echo -e "$2........$R Failure $N"
        exit 1
    else
        echo -e "$2........$G Success $N"
    fi
}
USERID=$(id -u)

if [ "$USERID" -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else 
    echo "MYSQL is already..... $Y Installed $N"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else 
    echo "Git is already..... $Y Installed $N"
fi