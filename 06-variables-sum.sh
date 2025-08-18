#!bin/bash
NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
echo "Script is executed at : $TIMESTAMP"
SUM=$(($NUMBER1+$NUMBER2))

echo "THE SUM OF numbers is : $SUM"