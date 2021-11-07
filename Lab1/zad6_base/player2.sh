#!/bin/bash


if [ -f komenda.txt ]; then
	echo "Player2 found komenda.txt"
	if [ $(head -n 1 komenda.txt) == "start" ];then
		if [ -f los2.txt ]; then
			echo "Los2.txt for Player1 already exists"
		else
			if [ $(head -n 1 komenda.txt) == "stop" ]; then
				exit 1
			else
				echo "Player2 START"
				SECRET=$(($RANDOM%3))
				echo $SECRET > los2.txt
			fi
		fi
	fi
fi

