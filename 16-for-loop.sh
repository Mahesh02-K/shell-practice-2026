#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$SCRIPT_NAME/$LOG_FOLDER.log"
packages=("httpd" "mysql" "nginx" "python3")

mkdir -p $LOG_FOLDER

#check root previleges
if [ $USERID -eq 0 ]
then
    echo -e "$Y You are running with root access $N" | tee -a $LOG_FILE
else
    echo -e "$R ERR ::: Please run this with root access $N" | tee -a $LOG_FILE
    exit 1
fi

#verify function takes input as exit status and what command they tried to install 
VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

for package in ${packages[@]}
do 
    dnf list installed $package -y &>>$LOG_FILE
    if [ $? -eq 0 ]
    then 
        echo -e "$package is $Y ALREADY INSTALLED $N ... Nothing to do" | tee -a $LOG_FILE
    else
        echo -e "$package is $R NOT INSTALLED $N ... Going to install" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VERIFY $? $package
    fi
done 

