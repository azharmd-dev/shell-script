#!/bin/bash

CPU_Usage=$(top -bn1 | grep "Cpu(s)")
CPU_Threshold=80
IP_Address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
Message=""

while IFS= read -r line
do

Usage=$(echo $line | awk '{print $8}' | cut -d "." -f1)

if [ $Usage -ge $CPU_Threshold ]; then
        Message+="High CPU usage of: $Usage % <br>" # escaping
    fi
done <<< $CPU_Usage

echo  "Message Body: $Message"

sh cpumail.sh "pkpk34366@gmail.com" "High CPU Usage Alert" "High CPU Usage" "$Message" "$IP_Address" "DevOps Team"
