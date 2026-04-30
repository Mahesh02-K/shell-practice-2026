#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

if [ $USERID -eq 0 ]
then
    echo -e "$G You are running with root access $N" | tee -a $LOG_FILE
else
    echo -e "$R ERR ::: Please run with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
fi

VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql -y &>>$LOG_FILE
if [ $? -eq 0 ]
then 
    echo -e "Mysql is $Y ALREADY INSTALLED $N ... Nothing to do" | tee -a $LOG_FILE
else
    echo -e "Mysql is $R NOT INSTALLED $N ... Going to install" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VERIFY $? Mysql
fi

dnf list installed httpd -y &>>$LOG_FILE
if [ $? -eq 0 ]
then 
    echo -e "Httpd is $Y ALREADY INSTALLED $N ... Nothing to do" | tee -a $LOG_FILE
else
    echo -e "Httpd is $R NOT INSTALLED $N ... Going to install" | tee -a  $LOG_FILE
    dnf install httpd -y &>>$LOG_FILE
    VERIFY $? Httpd
fi