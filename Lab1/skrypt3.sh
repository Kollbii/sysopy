#!/bin/bash

# Zadanie 3.
# Napisz skrypt, którego wywołanie jest następujące:
# $ ./skrypt03.sh <podstawa> <potega>
# Skrypt dla zadanych wartości oblicza potęgę liczby.
# (jedno rozwiązanie operatorem, jedno rozwiązanie pętlą)

if [ $# != 2 ]; then
	echo "Propper usage: ./skrypt3.sh <base> <power>"
fi

# First
# echo "$1^$2" | bc

# The propper one
counter=1
num=$1
if [ $2 == 0 ];then
	echo "0"
else
	while [ $2 -gt $counter ]
	do
		counter=$(($counter + 1))
		num=$(($num*$1))
	done
	echo $num
fi
