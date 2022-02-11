#!/bin/bash

# Zadanie 1.
# Napisz skrypt, którego wywołanie jest następujące:
# $ ./skrypt01.sh <katalog> <wielkość>
# Skrypt w podanym katalogu (i podkatalogach) wyszykuje najnowszy plik, jednocześnie większy niż podana wielkość w bajtach.


if [ $# != 2 ]; then
	echo "Propper usage: ./skrypt1.sh <katalog> <wielkość w bajtach>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "$1 is not a dir!"
	exit 1
fi

find $1 -type f -size +$2c -printf "%T@ %p\n" | sort -n | cut -d' ' -f2 | tail -n 1
