#!/bin/bash

CPU_Usage=$(top | grep id,)
CPU_Threshold=98
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r line
do

Usage=$(echo $line | awk '{print $8}')

if [ $Usage -ge $CPU_Threshold ]; then
        Message+="High CPU usage of: $USAGE % <br>" # escaping
    fi
done <<< $CPU_Usage