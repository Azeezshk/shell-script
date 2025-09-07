#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];
then
echo "You must have sudo access to run the script"
exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ];
then
    dnf install mysql -y
    if [ $? -ne 0 ];
    then
    echo "Installing MySQL....Failure"
    exit 1
    else
    echo "Installing MYSQL.......Success"
    fi
else 
echo "MySQL is already Installed....."
fi