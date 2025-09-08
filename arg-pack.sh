#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"


LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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
chmod 755 "$LOGS_FOLDER"


#creating loop for installing package

for package in $@
do
    dnf list installed $package -y &>> $LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y         &>> $LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
    echo "$package is Already Installed....!"
    fi
done


# Loop through all the packages passed as arguments ($@)
# Example: if script is run as ./script.sh mysql nginx git
# → First loop: package=mysql
# → Second loop: package=nginx
# → Third loop: package=git

# Check if the package is already installed
# 'dnf list installed <package>' returns:
# → 0 (success) if package is installed
# → non-zero (failure) if package is not installed
# Output is sent into the logfile instead of screen

# $? stores the exit status of the last command
# If value is not equal to 0, it means package is NOT installed

# Install the package using 'dnf install -y'
# -y automatically accepts prompts
# All install details are written into the logfile

# Call the VALIDATE function
# It takes:
# → $1 = exit status of previous command (success/failure)
# → $2 = custom message like "Installing mysql"
# Prints Success or Failure accordingly

# If package is already installed, print a user-friendly message
