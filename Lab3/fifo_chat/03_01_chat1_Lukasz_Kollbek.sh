#!/bin/bash

# ./chat1.sh [NAME]
if [ -e fifochat ]; then
    rm -rf fifochat
fi

mkfifo fifochat
chmod 0666 fifochat

while true
do
    read line
    echo "$1> $line" > fifochat
    cat < fifochat
done