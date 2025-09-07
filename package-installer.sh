#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];
then
echo "You must have sudo access to run the script"
exit 1
fi

dnf list installed nginx

if [ $? -ne 0 ];
then
    dnf install nginx -y
    if [ $? -ne 0 ];
    then
    echo "Installing Nginx....Failure"
    exit 1
    else
    echo "Insatalling Nginx.......Success"
    fi
else 
echo "Nginx is already Installed....."
fi

echo "Hello World !"