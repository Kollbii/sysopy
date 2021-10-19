#!/bin/bash


if [ -f komenda.txt ]; then
	echo "Player1 found komenda.txt"
	if [ $(head -n 1 komenda.txt) == "start" ];then
		if [ -f los1.txt ]; then
			echo "Los1.txt for Player1 already exists"
		else
			if [ $(head -n 1 komenda.txt) == "stop" ]; then
				exit 1
			else
				echo "Player1 START"
				SECRET=$(($RANDOM%3))
				echo $SECRET > los1.txt
			fi
		fi
	fi
fi

