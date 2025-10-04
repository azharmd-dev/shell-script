#!/bin/bash

Disk_Usage=$(df -hT | grep -v Filesystem)
Disk_Threshold=0 #Usually in project it is more(75)
IP_Address=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
Message=""

while IFS= read -r line
do
    Usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    Partition=$(echo $line | awk '{print $7}')
        if [ $Usage -ge $Disk_Threshold ]; then
            Messsage+="High Disk Usage on $Partition :: $Usage % <br>" #"+" it will append the previous message
        fi
done <<< $Disk_Usage
#if [ -n "$Message" ]; then
    echo "Message Body: $Message"
    sh mail.sh "pkpk34366@gmail.com" "High Disk Usage Alert" "High Disk Usage" "$Message" "$IP_Address" "DevOps Team"
#else
  #  echo "No partitions crossed threshold."
#fi


