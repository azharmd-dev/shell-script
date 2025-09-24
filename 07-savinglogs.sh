#!/bin/bash

USERID=$(id -u)
RD="\e[31m" #RED Color
GN="\e[32m" #GREEN Color
YW="\e[33m" #YELLOW Color
NC="\e[0m"  #NO Color

#To easily identify, save the log file with the script name.
Logs_Folder="/var/log/shell-script"
Script_Name=$(echo $0 | cut -d "." -f1)
Log_File="$Logs_Folder/$Script_Name.log" #/var/log/shell-script/07-savinglogs.log

mkdir -p $Logs_Folder
echo "Script started executed at: $(date)" | tee -a $Log_File

if [ $USERID -ne 0 ]; then
    echo "User requried a root previlege access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]; then
        echo -e "Installtion of $2 ---> $RD Failure $NC" | tee -a $Log_File
        exit 1
    else
        echo -e "Installation of $2 ---> $GN Success $NC" | tee -a $Log_File
    fi
}

dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$Log_File
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL is already installed ---> $YW SKIPPING $NC" | tee -a $Log_File
fi

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>$Log_File
    VALIDATE $? "NGINX"
else
    echo -e "NGINX is already installed ---> $YW SKIPPING $NC" | tee -a $Log_File
fi

dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>$Log_File
    VALIDATE $? "PYTHON"
else
    echo -e "PYTHON is already installed ---> $YW SKIPPING $NC" | tee -a $Log_File
fi