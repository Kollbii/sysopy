#!/bin/bash

# 0 - rock
# 1 - papper
# 2 - scissors

if [ $# -ne 1 ]; then
	echo "Propper usage ./serwer.sh <number_of_players> <number_of_games>"
	exit 1
fi

GAMES=$2
PLAYERS=$1
SCORE1=0
SCORE2=0

while [ $GAMES -gt 0 ]; do
	for ((i=0; i < $PLAYERS; i++)); do
		# echo "Test $GAMES"
		echo "start" > komenda.txt
		
		source ./player.sh
		
		sleep 0.1
		
		rm -rf komenda.txt
		
		GUESS=$(cat los$i.txt)
		
		rm -rf los$i.txt
		
		echo "Player$i: $GUESS" >> gra.log
	done
		if [[ $GUESS1 = 0 && $GUESS2 = 2 ]]; then
			echo "	Player1 won" >> gra.log
			SCORE1=$(($SCORE1+1))
		elif [[ $GUESS1 = 1 && $GUESS2 = 0 ]];then
			echo "	PLayer1 won" >> gra.log
			SCORE1=$(($SCORE1+1))
		elif [[ $GUESS1 = 2 && $GUESS2 = 1 ]]; then
			echo "	Player1 won" >> gra.log
			SCORE1=$(($SCORE1+1))
		elif [[ $GUESS1 = 2 && $GUESS2 = 0 ]]; then
			echo "	Player2 won" >> gra.log
			SCORE2=$(($SCORE2+1))
		elif [[ $GUESS1 = 0 && $GUESS2 = 1 ]]; then
			echo "	Player2 won" >> gra.log
			SCORE2=$(($SCORE2+1))
		elif [[ $GUESS1 = 1 && $GUESS2 = 2 ]]; then
			echo "	Player2 won" >> gra.log
			SCORE2=$(($SCORE2+1))
		else 
			echo "	Draw" >> gra.log
		fi
		GAMES=$(($GAMES - 1))
done

echo "For total of $1 games:"
echo "P1 scored: $SCORE1"
echo "P2 scored: $SCORE2"

echo "stop" > komenda.txt
sleep 1
rm -rf komenda.txt

exit 1




