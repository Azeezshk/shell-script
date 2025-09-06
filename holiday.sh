#!/bin/bash

Day=$(date +%A)

#date and day modification examples
#date +%a     # Abbreviated day name -> Tue
#date +%A     # Full day name -> Tuesday
#$date +%d     # Day of month -> 02
#date +%m     # Month number -> 09
#date +%b     # Abbreviated month -> Sep
#date +%B     # Full month -> September
#date +%Y     # Year -> 2025
#date +"%d-%m-%Y"   # Custom format -> 02-09-2025

echo "Today is : $Day "

if [ $Day = "Sunday" ] || [ $Day == "Saturday" ];
then
echo "Today is weekend. so i cannot work"
else
echo "Today , I am available"
fi