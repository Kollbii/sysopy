#!/bin/bash

if [ $# != 2 ];then
	echo "Propper usage: ./skrypt1.sh <dir> <size>"
fi

find $1 -type f -size +$2c -printf "%T@ %p\n" | sort -nr | awk '{print $2}' | head -n 1
