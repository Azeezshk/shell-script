#!/bin/bash

Num=$1

if [ "$Num" -gt 100 ];
then
echo "The number entered is greater than 100 which is $((Num - 100)) more"
else
echo "The number entered is lesser than 100 which is $((100 - Num)) less"
fi

if [ "$Num" -gt 100 ]; then
    echo "The number entered is greater than 100, which is $((Num - 100)) more."
elif [ "$Num" -lt 100 ]; then
    echo "The number entered is less than 100, which is $((100 - Num)) less."
else
    echo "The number entered is exactly 100."
fi