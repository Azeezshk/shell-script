#!/bin/bash
VALIDATE(){
     if [ $1 -ne 0 ]
    then 
        echo "$2........Failure"
        exit 1
    else
        echo "$2........Success"
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
    VALIDATE $? "Installing....MySQL"
else 
    echo "MYSQL is already Installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing....Git"
else 
    echo "Git is already Installed"
fi