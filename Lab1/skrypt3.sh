#!/bin/bash

# Zadanie 3.
# Napisz skrypt, którego wywołanie jest następujące:
# $ ./skrypt03.sh <podstawa> <potega>
# Skrypt dla zadanych wartości oblicza potęgę liczby.
# (jedno rozwiązanie operatorem, jedno rozwiązanie pętlą)

if [ $# != 2 ];then
	echo "Propper usage: ./skrypt3.sh <base> <power>"
	exit
fi

CNT=1
NUM=$1
if [ $2 == 0 ];then
	echo "0"
else
	while [ $2 -gt $CNT ]
	do
		CNT=$(($CNT + 1))
		NUM=$(($NUM*$1))
	done
	echo $NUM
	exit 1
fi
