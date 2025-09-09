#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

SOURC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if days not given - 14 days will be default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print$NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME=$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP


USAGE(){
    #echo -e "USAGE : backup.sh <SOURC_DIR> <DEST_DIR> <DAYS (OPTIONAL)>"
    echo -e "USAGE : backup <SOURC_DIR> <DEST_DIR> <DAYS (OPTIONAL)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
fi


if [ ! -d "$SOURC_DIR" ]
then
    echo "$SOURC_DIR source directory does not exist....Please check"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo "$DEST_DIR Destination directory does not exist...Please check"
    exit 1
fi


echo "Script executed at : $TIMESTAMP"          &>>$LOG_FILE_NAME

FILES=$(find $SOURC_DIR -name "*.log" -mtime +$DAYS )

if [ -n "$FILES" ] #true if files are to zip
then
    echo "FILES are : $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURC_DIR -name "*.log" -mtime +$DAYS | zip @ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo "Successfuly created zip file for more than $DAYS"
        while read -r filepath # here filepath is the variable name....
        do
            echo "FILES TO BE DELETED : $filepath"   &>>$LOG_FILE_NAME
            rm -rf $filepath
            echo "FILES DELETED : $filepath"
        done <<< $FILES
    else
        echo "Error : failed to created the zip file"
        exit 1
    fi
else
    echo "No files found older than  $DAYS"
fi


