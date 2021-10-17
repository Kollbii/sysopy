#!/bin/bash

# 0 - rock
# 1 - papper
# 2 - scissors

if [ -f "komenda.txt" ]; then
	# echo "Player1 found komenda.txt"
	# echo "Player1 checking for start in komenda.txt"
	COM=$(head -n 1 komenda.txt)
	if [ $COM == "start" ]; then
		if [ -f "los1.txt" ]; then
			echo "Guess for player1 already exists..."
		else
			# echo "Player1 found start command"
			# echo "Player1 creating los1.txt..."
			echo $(($RANDOM%3)) > los1.txt
		fi
	fi
fi
