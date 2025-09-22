#!/bin/bash

RD="\e[31m"
GN="\e[32m"
YW="\e[33m"
NC="\e[0m"

echo -e "Write a script to $GN identify $NC the $RD ODD $NC and $YW Ever $NC number"
#After allocating color to the sentence or word we should add $NC after the sentence,
#otherwise the color will be applied to entire text.