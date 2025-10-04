#!/bin/bash

CPU_Usage=$(top -bn1 | grep "Cpu(s)")
CPU_Threshold=80
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r line
do

Usage=$(echo $line | awk '{print $8}')

if [ $Usage -ge $CPU_Threshold ]; then
        Message+="High CPU usage of: $USAGE % <br>" # escaping
    fi
done <<< $CPU_Usage

echo -e "Message Body: $Message"