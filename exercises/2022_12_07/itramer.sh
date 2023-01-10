#!/bin/bash

if [[ $# -ne 2 ]]
then
	echo "Deux arguments attendus"
	echo "	<dossier> <lang>"
	exit
fi

folder=$1 # dumps text OU context
basename=$2 # en, fr, ch...
# Le basename correspond à la langue qu'on étudie.

mkdir itramer
itramer="itramer/dumptext-$basename"

echo "<lang=\"$basename\">" > $itramer

for filepath in $(ls $folder-*.txt)
do
	# filepath == dumps-texts/fr-1.txt
	#  ===> pagename = fr-1
	pagename=$(basename -s .txt $filepath) # retire l'extension .txt
	echo "<page=\"\">" >> $itramer
	echo "<text>" >> $itramer

	# On récupère les dumps et on écrit à l'intérieur de la balise text.
	content=$(cat $filepath)
	# Il faut substituer par les caractères donnés
	# faire attention a l'ordre des substitutions: d'abord les esperluettes..
	# sinon: < => &lt; => &amp;lt;
	content=$(echo "$content" | sed "s/&/&amp;/g")
	content=$(echo "$content" | sed "s/</&lt;/g")
	content=$(echo "$content" | sed "s/>/&gt;/g")
	# dans sed, /g = de façon globalisée dans le contenu

	echo "$content" >> $itramer

	echo "</text>" >> $itramer
	echo "</page> §" >> $itramer
done

echo "</lang>" >> $itramer
