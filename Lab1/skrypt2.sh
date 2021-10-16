#!/bin/bash

# Napisz skrypt, którego wywołanie jest następujące:
# $ ./skrypt02.sh <min> <max>
# Skrypt losuje liczbę całkowitą z podanego zakresu i umożliwia wykonanie tradycyjnej rozgrywki “zgadnij liczbę”.
# Dla Cyberbezpieczeństwa:
# Ograniczyć liczbę prób do 10.
# Sprawdzać, czy max > min.

if [ $# != 2 ]; then
	echo "Propper usage ./skrypt2 <min> <max>"
	exit 1
fi

SECRET=$(($((RANDOM%$(($2-$1)))) + $1))
# echo $SECRET

read GUESS
while [ $GUESS -ne $SECRET ]
do
	if [ $GUESS -lt $SECRET ]; then
		echo "Higher!"
	else
		echo "Lower..." 
	fi
	read GUESS
done

echo "You won! The secret number was $SECRET"