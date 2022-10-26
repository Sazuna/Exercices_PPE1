#!/bin/bash

if [ -z $1 ]
then
	echo "Too few arguments."
	exit
fi

if [[ $1 =~ bon(jour|soir) ]]
then
	echo "salut"
fi
