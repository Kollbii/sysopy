#!/bin/bash

# Zadanie 6. * (tylko Cyberbezpieczeństwo)
# Napisz skrypty grające w “papier-nożyce-kamień”:
# Jeden skrypt (serwer.sh) będzie “serwerem”, który:
# Dla zadanego parametru wywołania, na przykład:
# $ ./serwer.sh 10
# Wykona zadaną liczbę gier “papier-nożyce-kamień” (w podanym przykłądzie to będzie 10 razy) 
# sktyptami opisanymi dalej (gracz1.sh i gracz2.sh) poprzez opisany poniżej algorytm:
# Utwórz plik ‘komenda.txt’, a w nim zapisz komendę: ‘start’
# Odczekaj, aż pojawią się oba pliki: los1.txt i los2.txt, a następnie:
# Odczekaj 0.1 [s]
# Skasuj plik ‘komenda.txt’
# Pobierz z obu plików los1.txt i los2.txt zawartość
# Rozstrzygnij wynik i zapisz go do gra.log
# Skasuj pliki los1.txt i los2.txt
# Po wykonaniu zadanej liczby gier podaj sumaryczny wynik
# Do pliku ‘komenda.txt’ wpisz komendę: ‘stop’
# Odczekaj 1 [s]
# Skasuj plik ‘komenda.txt’
# Zakończ działanie.
# Dwa takie same skrypty (gracz1.sh i gracz2.sh), które będą graczami:
# Sprawdzają istnienie pliku ‘komenda.txt’ oraz jego zawartość:
# Jeśli jest w nim ‘start’ i jednocześnie nie ma pliku odpowiednio los1.txt lub los2.txt, 
# to skrypt losuje ‘papier-nożyce-kamień’ i wylosowany wynik zapisuje odpowiednio w los1.txt lub los2.txt,
# Jeśli jest w nim ‘stop’, zakończ działanie.
# Jaki będzie wynik gry z parametrem 1000 ?
# Czy potrafisz zmodyfikować plik serwer.sh tak, aby sam uruchamiał graczy ?
# Czy spróbujesz rozbudować serwer.sh tak, aby także mógł obsługiwać dowolną liczbę graczy też 
# podawaną jako parametr, np.: $ ./serwer.sh <liczba graczy> <liczba gier>.


if [ $# != 1 ]; then
	echo "Propper usage ./serwer.sh <num_of_games>"
	exit 1
fi

GAMES=$1
P1=0
P2=0

while [ $GAMES -gt 0 ]; do
	echo "start" > komenda.txt

	source ./player1.sh
	source ./player2.sh

	sleep 0.1

	# Optional for debuging
	# --------------------
	# cat komenda.txt
	# cat los1.txt
	# cat los2.txt
	# --------------------
	rm -rf komenda.txt

	GUESS1=$(cat los1.txt)
	GUESS2=$(cat los2.txt)

	echo "Player1: $GUESS1	vs	Player2: $GUESS2"

	if [[ $GUESS1 = 0 && $GUESS2 = 2 ]]; then
		echo "Player1 won"
		P1=$(($P1 + 1))
	elif [[ $GUESS1 = 2 && $GUESS2 = 1 ]]; then
		echo "Player1 won"
		P1=$(($P1 + 1))
	elif [[ $GUESS1 = 1 && $GUESS2 = 0 ]]; then
		echo "Player1 won"
		P1=$(($P1 + 1))
	elif [[ $GUESS1 = 0 && $GUESS2 = 1 ]]; then
		echo "Player2 won"
		P2=$(($P2 + 1))
	elif [[ $GUESS1 = 1 && $GUESS2 = 2 ]]; then
		echo "Player2 won"
		P2=$(($P2 + 1))
	elif [[ $GUESS1 = 2 && $GUESS2 = 0 ]]; then
		echo "Player2 won"
		P2=$(($P2 + 1))
	else
		echo "Draw"
	fi

	rm -rf los1.txt
	rm -rf los2.txt

	GAMES=$(($GAMES - 1))
done

echo "Player1 scored: $P1"
echo "Player2 scored: $P2"