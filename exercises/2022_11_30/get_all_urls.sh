#!/bin/bash

#1st argument = word
#2nd and more arguments = path/to/file/containing/urls.txt

# If there are less than two arguments
if [[ $# -lt 2 ]]
then
	echo "Minimum two argument."
	echo "Use :"
	echo "    ./get_all_urls.sh [[-n]] [WORD] [FILES...]"
	echo "    --n is for the context dump: \\n will be removed and not replaced by spaces."
	exit 1
fi

echo "premier argument = $1"

NO_SPACES=
if [ "$1" = "-n" ]
then
	echo "$1 NO SPACE"
	NO_SPACES=$1
	shift
fi

# WORD will be the name of the directory to store the generated data
WORD=$1

# shift removes the first argument
shift

# For every arguments after WORD
for FILE in $@
do
	if [ ! -f $FILE ]
	then
		echo "$FILE does not exist."
		echo "It should be a file containing a list of urls."
	else
		echo "./get_url.sh $NO_SPACES $WORD $FILE"
		./get_url.sh $NO_SPACES $WORD $FILE
	fi
done
CONCORDANCE_F="./generated/concordances/$WORD.html"
./table.sh "./generated/concordances/$WORD.csv" > $CONCORDANCE_F
