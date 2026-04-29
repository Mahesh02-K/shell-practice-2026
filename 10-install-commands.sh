#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo "You are running with root access :: SUCCESS"
else
    echo "Please run with root access :: ERROR"
    exit 1 #give other 0 upto 127
fi

dnf list installed mysql -y

# check already installed or not. if Installed $? is 0, then 
# If not installed $? is not 0. expression is false
if [ $? -eq 0 ]
then 
    echo "Mysql is already installed.. Nothing to do"
else
    echo "Mysql is not installed.. Going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "Installing Mysql is :: SUCCESS"
    else 
        echo "Installing Mysql is :: FAILURE"
        exit 1 
    fi
fi


# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing Mysql is SUCCESS"
# else
#     echo "Installing Mysql is FAILURE"
#     exit 1
# fi