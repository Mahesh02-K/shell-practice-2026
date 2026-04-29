#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo "You are running with root access"
else
    echo "Please run this script with root access :: ERR"
    exit 1
fi 

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo "Installing $2 is ... SUCCESS"
    else
        echo "Installing $2 is ... FAILURE"
        exit 1
    fi
}

dnf list installed mysql -y

if [ $? -eq 0 ]
then 
    echo "Mysql is already installed.. Nothing to do"
else
    echo "Mysql is not installed.. Going to install"
    dnf install mysql -y
    VALIDATE "Mysql"
fi 

dnf list installed python3 -y

if [ $? -eq 0 ]
then
    echo "Python is already installed.. Nothing to do"
else
    echo "Python is not installed.. Going to install"
    dnf install python3 -y
    VALIDATE "python3"
fi

dnf list installed nginx -y

if [ $? -eq 0 ]
then
    echo "Nginx is already installed.. Nothing to do"
else
    echo "Nginx is not installed.. Going to install"
    dnf install nginx -y
    VALIDATE "nginx"
fi
