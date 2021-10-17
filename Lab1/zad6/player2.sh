#!/bin/bash

# 0 - rock
# 1 - papper
# 2 - scissors

if [ -f "komenda.txt" ]; then
	# echo "Player2 found komenda.txt"
	# echo "Player2 checking for start in komenda.txt"
	COM=$(head -n 1 komenda.txt)
	if [ $COM == "start" ]; then
		if [ -f "los2.txt" ]; then
			echo "Guess for player2 already exists..."
		else
			# echo "Player2 found start command"
			# echo "Player2 creating los1.txt..."
			echo $(($RANDOM%3)) > los2.txt
		fi
	fi
fi
