#!/bin/bash


if [ -f komenda.txt ]; then
	echo "Player$1 found komenda.txt"
	if [ $(head -n 1 komenda.txt) == "start" ];then
		if [ -f los$1.txt ]; then
			echo "Los$1.txt for Player already exists"
		else
			if [ $(head -n 1 komenda.txt) == "stop" ]; then
				exit 1
			else
				echo "Player$1 START"
				SECRET=$(($RANDOM%3))
				echo $SECRET > los$1.txt
			fi
		fi
	fi
fi

