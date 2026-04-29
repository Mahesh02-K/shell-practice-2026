#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo "You are running with root access :: SUCCESS"
else
    echo "Please run with root access :: ERROR"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing Mysql is SUCCESS"
else
    echo "Installing Mysql is FAILURE"
    exit 1
fi