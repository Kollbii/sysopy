#!/bin/bash

if [ $# != 2 ]; then
	echo "Podaj tylko dwa argumenty! <katalog> <wielkość w bajtach>"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "$1 nie jest katalogiem"
	exit 1
fi

sudo find $1 -type f -size +$2c -printf "%T@ %p\n" | sort -n | cut -d' ' -f2 | tail -n 1
