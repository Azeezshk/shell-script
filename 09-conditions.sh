#!/bin/bash

NUMBER=$1

#gt greater tha, lt- less than, ge -great than or equal to, le - less than or equal to, 
#eq - equal to

# if [ $NUMBER -gt 100 ]
# then
#     echo "Given number is greater than 100"
# else 
#     echo "Given number is less than or equal to 100"
# fi

if [ $NUMBER -lt 100 ];
then
echo "The number is less than 100"
else
echo "The number given is less than or equal to 100"