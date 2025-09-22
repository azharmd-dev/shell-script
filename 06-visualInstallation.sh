#!/bin/bash

USERID=$(id -u)
RD="\e[31m" #RED Color
GN="\e[32m" #GREEN Color
YW="\e[33m" #YELLOW Color
NC="\e[0m"  #NO Color

if [ $USERID -ne 0 ]; then
    echo "The user required root privilege access to run the script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR >> Installation of the application $2 is $RD FAILURE $NC"
        exit 1
    else
        echo -e "Installtion of the application $2 is $GN SUCCESS $NC"  
    fi
}

dnf list installed nginx #To check nginx is installed or not
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "The NGINX already installed so $YW SKIPPING $NC the installation"
fi

dnf list installed python3 #To check Python is installed or not
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "The PYTHON already installed so $YW SKIPPING $NC the installation"
fi

dnf list installed mysql #To check MYSQL is installed or not
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "The MYSQL already installed so $YW SKIPPING $NC the installation"
fi