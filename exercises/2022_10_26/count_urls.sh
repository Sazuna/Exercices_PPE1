#!/bin/bash


if [[ $# -ne 1 ]]
then
	echo "Ce programme demande un argument"
fi

if ! [[ -f $1 ]]
then
	echo "Le fichier n'existe pas"
	exit
fi


FICHIERS_URL=$1

OK=0
NOK=0

while read -p text LINE;
do
	if [[ "$LINE" =~ ^https?:// ]]
	then
		OK=$(expr $OK + 1)
	else
		NOK=$(expr $NOK + 1)
	fi
done < $FICHIERS_URL

echo "Il y a $OK urls valides"
echo "Il y a $NOK urls non valides"
