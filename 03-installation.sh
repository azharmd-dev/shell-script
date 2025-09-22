#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: User requried root previleg access to run the commond"
    exit 1
fi