#!/bin/bash
To_Address=$1
Subject=$2
Alert_Type=$3
Message_Body=$4
Formatted_Body=$(printf '%s\n' "$Message_Body" | sed -e 's/[]\/$*.^[]/\\&/g')
IP_Address=$5
To_Team=$6

Final_Body=$(sed -e "s/To_Team$To_Team/g" -e "s/Alert_Type/$Alert_Type/g" -e "s/IP_Address/$IP_Address/g" -e "s/Message/$Formatted_Body/g" template.html)

{
echo "To: $To_Address"
echo "Subject: $Subject"
echo "Content-Type: text/html"
echo ""
echo "$Final_Body"
} | msmtp "$To_Address"