#!/bin/bash

# Napisać skrypt, który wczytuje dowolną liczbę parametrów i wypisuje je w odwrotnej kolejności.
# Przykład:
# $ ./skrypt05.sh a b 1 2
# 2 1 b a

for (( i=$(($#)); i > 0; i-- )); do
	# echo ${!i}
	RET=$(echo "$RET ${!i}")
done
echo $RET
