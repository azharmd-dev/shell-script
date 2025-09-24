#!/bin/bash

USERID=$(id -u)
RD="\e[31m" #RED Color
GN="\e[32m" #GREEN Color
YW="\e[33m" #YELLOW Color
NC="\e[0m"  #NO Color

if [ $USERID -ne 0 ]; then
    echo "User requried a root previlege access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]; then
        echo -e "Installtion of $2 ---> $RD Failure $NC"
        exit 1
    else
        echo -e "Installation of $2 ---> $GN Success $NC"
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL is already installed ---> $YW SKIPPING $NC"
fi

dnf list installed nginx 
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "NGINX is already installed ---> $YW SKIPPING $NC"
fi

dnf list installed python3 
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "PYTHON"
else
    echo -e "PYTHON is already installed ---> $YW SKIPPING $NC"
fi