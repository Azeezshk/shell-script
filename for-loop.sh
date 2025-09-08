#!/bin/bash

echo "For loop starts here........!"

count=1
for i in {0..9}
do
    echo "$i"
done

echo "while loop starts here......!"

count=1

while [ $count -le 9 ]
do
    echo "While count : count $count"
    ((count++))
done

echo "until loop starts here......!"

count=1

until [ $count -gt 9 ]
do
    echo "Until loop : count $count"
    ((count++))
done