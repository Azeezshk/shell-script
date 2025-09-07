#/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"   # Directory where all script logs will be stored
LOG_FILE=$(echo "$0" | cut -d "." -f1)   # Get the script name (without extension) to use as log file prefix
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)   # Current date and time, used to make log file unique
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"   # Full path of the log file (folder + script name + timestamp)


# VALIDATE: $1 = exit status, $2 = message

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2...........$R Failure $N"
        exit 1
    else
        echo -e "$2...........$G Success $N"
    fi
}


echo "Script executed at : $TIMESTAMP"                      &>> "$LOG_FILE_NAME"

# Root check
USERID=$(id -u)

if [ $USERID -ne 0 ];
then
    echo -e "$B You must have root access to run the script..... ): $N"
    exit 1
fi

# Create log folder (no error if it already exists)
mkdir -p "$LOGS_FOLDER"

# Set permissions: owner rwx, others rx
chmod 755 "$LOGS_FOLDER"


# Example install: MySQL 
dnf list installed mysql                                    &>> "$LOG_FILE_NAME"

if [ $? -ne 0 ];
then
    dnf install mysql -y                                    &>> "$LOG_FILE_NAME"
    VALIDATE $? " $G Installing MySQL $N" 
else
    echo -e "$Y MySQL is already Installed...! $N"
fi


# Example install: Git 
dnf list installed git                                      &>> "$LOG_FILE_NAME"

if [ $? -ne 0 ];
then
    dnf install git -y                                      &>> "$LOG_FILE_NAME"
    VALIDATE $? "$Y Installing Git $N"
else
    echo -e "$Y Git is Already Installed....! $N"
fi