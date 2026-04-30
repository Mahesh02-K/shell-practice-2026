#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check root previleges
if [ $USERID -eq 0 ]
then
    echo -e "You are running with root access ... $Y PROCEED $N"
else
    echo -e "$R ERR :::$Y Please run this with root access $N"
    exit 1
fi

#verify function takes input as exit status and what command they try to install
VERIFY(){
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is ... $G SUCCESS $N"
    else 
        echo -e "Installing $2 is ... $R FAILURE $N"
        exit 1
    fi
}

dnf list installed mysql -y
if [ $? -eq 0 ]
then 
    echo -e "Mysql is $Y ALREADY INSTALLED $N ... Nothing to do"
else
    echo -e "Mysql is $R NOT INSTALLED $N ... Going to install"
    dnf install mysql -y
    VERIFY $? Mysql
fi
