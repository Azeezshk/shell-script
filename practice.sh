#!bin/bash

Name=$1
Age=$2

Tomatoes=100
Onions=200
SUM=$((Tomatoes + Onions))

Today=$(date)
Hostname=$(hostname)


echo "The first line of argument is $1 "
echo "The seconf argument is $2 "

echo "My name is $Name and my age is $Age "

echo " $1 and $2 is my name and age........................! "

echo " The total sum of Tomatoes and Onions are : $SUM "


echo "Today is : $Today" 

echo "And the current hostname of this system is $Hostname"

echo "All arguments are :$@ and $# "

echo " Total number of arguments are : $# "

echo " my present working directory is $PWD "

echo "The home directory of current user is : $HOME "

echo "the username who is running the script is :$USER "

echo "The script name of this script is : $0 "

echo "The process id of the current script is : $$ "

echo "The process id of the last command run is : $! "

echo " the last command exit status is : $? "