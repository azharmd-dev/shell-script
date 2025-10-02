#!/bin/bash

Userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/shell-script"
Script_Name=$(echo $0 | cut -d "." -f1)
Log_File=$Log_Folder/$Script_Name.log

mkdir -p $Log_Folder
echo "Script execution is started ::: $(date)" | tee -a $Log_File

Source_Dir=/home/ec2-user/app-logs

if [ ! -d $Source_Dir ]; then
    echo -e "$Source_Dir does not exit"
    exit 1
fi

File_to_delete=$(find $Source_Dir -name "*.log" -type f -mtime +14)

while IFS= read -r filepath
do
    echo "Deleting the file: $filepath"
    rm -rf $filepath
    echo "Deleted the file: $filepath"
done <<< $File_to_delete