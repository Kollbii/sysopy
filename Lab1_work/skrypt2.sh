#!/bin/bash

if [ $# != 2 ]; then
	echo "Propper usage ./skrypt2.sh <min> <max>"
fi

SECRET=$(($RANDOM%$(($2 - $1)) + $1))
echo $SECRET

read GUESS

while [ $GUESS -ne $SECRET ];do
	if [ $GUESS -gt $SECRET ]; then
		echo "Lower..."
	else
		echo "Higher..."
	fi
	read GUESS
done

echo "You guessed! It was $SECRET"

