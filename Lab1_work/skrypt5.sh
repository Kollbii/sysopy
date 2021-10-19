#!/bin/bash

if [ $# = 0 ]; then
	echo "You have to put at least 1 element"
fi

RET=""

for ((i=$#; $i > 0; i--)); do
	RET=$(echo "$RET ${!i}")
done

echo $RET
