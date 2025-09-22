#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: User requried root privilege access to run the commond"
    exit 1
fi

dnf install nginx -y 

if [ $? -ne 0 ]; then
    echo "Installation of nginx is <<failure>>"
    exit 1
else 
    echo "Installation of nginx is <<success>>"
fi