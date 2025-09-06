!/bin/bash

echo "Please enter your Username :: "

read -s USERNAME

echo "username entered: $USERNAME"

echo "please enter your password :: "

read -s PASSWORD



# read -p "Please enter your Username :: " USERNAME
# echo " Entered Username is $USERNAME "

# read -s -p "Please enter your password :: " PASSOWRD
# echo " Login successfull ! "

# CORRECT_USERNAME="Admin"
# CORRECT_PASSWORD="azeez15176"

# read -p " Please Enter Username : " USERNAME
# echo " Entered Username is $USERNAME "

# read -s -p " Please enter your Password : " PASSWORD
# echo

# if [[ "$USERNAME" == "$CORRECT_USERNAME" && "$PASSWORD" == "$CORRECT_PASSWORD" ]];
# then
# echo " Login successful "
# else
# echo " Login not successfull....Please enter valid details "
# fi