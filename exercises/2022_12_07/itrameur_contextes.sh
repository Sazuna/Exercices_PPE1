#!/bin/bash

if [[ $# -lt 2 ]]
then
	echo "Minimum two arguments."
	echo "Use :"
	echo "	./itramer.sh <WORD> <LANGUAGE>"
	exit 1
fi

WORD=$1
LANGUAGE=$2
FOLDER="./generated/contexts/$WORD*.txt"
ITRAMEUR_F="./generated/itrameur/$WORD-itramer.xml"

# Test if the folder exists
if [[ ! -d $FOLDER ]]
then
	echo "Directory $FOLDER does not exist."
	exit 1
fi

echo "<lang=\"$LANGUAGE\">" > $ITRAMER_F

for CONTEXT_F in $(ls $FOLDER/$WORD-*.txt)
do
	CONTEXT=$(basename -s .txt $CONTEXT_F)
	echo "<page=\"$CONTEXT\">" >> $ITRAMEUR_F
	echo "<text>" >> $ITRAMER_F

	# Get dumps et on écrit à l'intérieur de la balise text.
	CONTENT=$(cat $CONTEXT_F)
	CONTENT=$(echo "$CONTENT" | sed 's/\&/\&amp;/g')
	CONTENT=$(echo "$CONTENT" | sed 's/</\&lt;/g')
	CONTENT=$(echo "$CONTENT" | sed 's/>/\&gt;/g')

	echo "$CONTENT" >> $ITRAMEUR_F

	echo "</text>" >> $ITRAMEUR_F
	echo "</page> §" >> $ITRAMEUR_F
done

echo "</lang>" >> $ITRAMEUR_F
