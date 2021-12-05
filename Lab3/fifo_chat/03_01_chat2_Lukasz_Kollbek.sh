#!/bin/bash

# ./chat2.sh [NAME]
if [ -e fifochat ]; then
    rm -rf fifochat
fi

mkfifo fifochat
chmod 0666 fifochat

while true
do
    cat < fifochat
    read line
    echo "$1> $line" > fifochat
done