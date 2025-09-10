#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"


SOURC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print$NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo "USAGE : backup <SOURC_DIR> <DEST_DIR> <DAYS (OPTIONAL)>"
    exit 1
}


mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
fi


if [ ! -d $SOURC_DIR ]
then
    echo "$SOURC_DIR source directory does not exists....."
    exit 1
fi


if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR destination directory does not exists......"
    exit 1
fi


echo "The script is executed at : $TIMESTAMP" &>> $LOG_FILE_NAME


FILES=$( find $SOURC_DIR -name "*.log" -mtime +$DAYS )
if [ -n "$FILES" ]
then
    echo " FILES ARE : $FILES "
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURC_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f $ZIP_FILE ]
    then
        echo "SUCCESSFULLY CREATED ZIP FILES FOR OLDER THAN $DAYS"
        while read -r filepath
        do
            echo "FILES TO BE DELETED : $filepath"
            rm -rf $filepath
            echo "Files deleted are : $filepath"
        done <<< $FILES
    else
        echo "Failed to create ZIP files......"
        exit 1
    fi
else
    echo "No files found older than $DAYS"
fi