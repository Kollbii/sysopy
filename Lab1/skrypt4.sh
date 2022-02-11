#!/bin/bash

# Zadanie 4*. (tylko Cyberbezpieczeństwo)
# Napisz skrypt, którego wywołanie jest następujące:
# $ ./skrypt04.sh <dokument.pdf> <podpis.png> <x> <y>
# Skrypt wykorzysta oprogramowanie ImageMagick i w pliku <dokument.pdf> nałoży zawartość pliku <podpis.png> w pozycji <x> i <y>.
# (brak możliwości zrealizowania w laboratorium uczelnianym)

if [ $# != 4 ]; then
	echo "Propper usage ./skrypt04.sh <dokument.pdf> <podpis.png> <x> <y>"
	exit 1
fi

convert -density 200 -size 25% $1 foto.png
composite -gravity southeast -geometry +$3+$4 $2 foto.png foto.png
convert foto.png signed.pdf
rm -rf foto.png

# PDF --> png --> sign png --> png to PDF
# convert -density 200 -size 25% document.pdf foto.png
# composite -gravity southeast -geometry +160+820 signat.png foto.png kox.png
# convert kox.png docs.pdf