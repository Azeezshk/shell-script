#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

SOURC_DIR="/home/ec2-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.........Failure"
        exit 1
    else
        echo "$2.........Success"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "You must have root access to run the script"
    fi
}

echo "The script executed at : $TIMESTAMP" &>> $LOG_FILE_NAME


FILES_TO_DELETE=$(find $SOURC_DIR -name "*.log" -mtime +14 )
echo "Files to be Deleted =$FILES_TO_DELETE"

while read -r filepath
do
    echo "Deleting file : $filepath"       &>>$LOG_FILE_NAME
    rm -rf $filepath
    echo "Deleting files are : $filepath"
done <<< $FILES_TO_DELETE
