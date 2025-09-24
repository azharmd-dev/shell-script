#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 )
Log_File="$Logs_Folder/$Script_Name.log" # /var/log/shell-script/09-Insloops.log

mkdir -p $Logs_Folder
echo "Script started executed at: $(date)" | tee -a $Log_File

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 
fi

VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $Log_File
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $Log_File
    fi
}

for package in $@
do
    #This will package installed or not
    dnf list installed $package &>>$Log_File 

        if [ $? -ne 0 ]; then
            dnf install $package -y &>>$Log_File
            VALIDATE $? "$package"
        else
            echo -e "$package already installed ... $Y SKIPPING $N"
        fi
done
