#!/bin/bash

# 0 - rock
# 1 - papper
# 2 - scissors

if [ $# -ne 2 ]; then
	echo "Propper usage ./serwer.sh <number_of_players> <number_of_games>"
	exit 1
fi

GAMES=$2
PLAYERS=$1

echo "start" > komenda.txt

rm -rf gra.log
rm -rf wynik.log

while [ $GAMES -gt 0 ]; do
	for ((i=0; i < $PLAYERS; i++)); do		
		source ./player.sh $i
		
		sleep 0.1
		
		GUESS=$(cat los$i.txt)
		
		echo "Player$i: $GUESS" >> gra.log
	done
	GAMES=$(($GAMES - 1))


	for ((i=0; i < $PLAYERS; i++)); do
		CURRENT=$(cat los$i.txt)
		SCORE1=0
		for ((j=0; j < $PLAYERS; j++));do
			if [ $i -ne $j ]; then
				# echo "Compare $i with $j"
				COMPARED=$(cat los$j.txt)
				if [[ $CURRENT = 0 && $COMPARED = 2 ]]; then
					# echo "	Player$i won" >> gra.log
					SCORE1=$(($SCORE1+1))
				elif [[ $CURRENT = 1 && $COMPARED = 0 ]];then
					# echo "	Player$i won" >> gra.log
					SCORE1=$(($SCORE1+1))
				elif [[ $CURRENT = 2 && $COMPARED = 1 ]]; then
					# echo "	Player$i won" >> gra.log
					SCORE1=$(($SCORE1+1))
				else 
					echo "	Draw" >> gra.log
				fi
			fi
		done
		echo "Player$i scored:$SCORE1" >> gra.log
		echo "P$i:$SCORE1" >> wynik.log
	done
	
	for ((i=0; i < $PLAYERS; i++)); do
		rm -rf los$i.txt
		echo "Deleting $i"
	done

done

echo "stop" > komenda.txt
sleep 1
rm -rf komenda.txt


for ((i=0; i < $PLAYERS; i++)); do
	POINTS=$(cat wynik.log |grep -E "P$i"| awk -F ":" '{print $2}' | awk '{Total=Total+$1} END{print Total}')
	echo "Player$i scored:$POINTS"
done


exit 1




