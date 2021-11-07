#!/bin/bash

# Napisać skrypt, który wczytuje dowolną liczbę parametrów i wypisuje je w odwrotnej kolejności.
# Przykład:
# $ ./skrypt05.sh a b 1 2
# 2 1 b a

if [ $# = 0 ]; then
	echo "You have to put at least 1 element"
	exit
fi

RET=""

# for i; do
# 	RET="$i $RET"
# done

# ^ Nice alternatywa ^

for ((i=$#; $i > 0; i--)); do
	RET=$(echo "$RET ${!i}")
done

echo $RET
