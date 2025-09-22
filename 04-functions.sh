#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "User required root previlege access to execute the script"
    exit 1
fi

VALIDATE(){ #Function receive the inputs through argument
    if [ $1 -ne 0 ]; then
        echo "ERROR:: The Installtion of $2 is <<Failure>>"
        exit 1
    else
        echo " Installation of $2 is <<Success>>"
    fi
}

dnf install nginx -y 
 VALIDATE $? "nginx"

dnf install mysql -y
    VALIDATE $? "MYSQL"