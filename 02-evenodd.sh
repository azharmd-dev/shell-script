#!/bin/bash

echo "Please enter the number ::"
read Number

if [ $(($Number % 2)) -eq 0 ]; then
    echo "The given number is $Number is EVEN"
else 
    echo "The given number is $Number is ODD"
fi